//
//  DZWebView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZWebView.h"
#import "DZRefreshHeader.h"
#import "PRNetWorkErrorView.h"
#import "LoadingAniView.h"

@interface DZWebView ()<WKNavigationDelegate,WKUIDelegate,PRNetWorkErrorViewDelegate>
{
    BOOL m_isWebReload;
    LoadingAniView * m_actView;
}
@property(nonatomic,assign) WebCSSMode CssMode;
@property (nonatomic, copy) NSString *urlLoad;  //!< 属性注释
@property (nonatomic, strong) DZWebUrlCenter *urlCenter;  //!< 属性注释
@property (nonatomic, strong) WebViewJavascriptBridge * jsBridge;
@property (nonatomic,strong) PRNetWorkErrorView *errorView;
@property (nonatomic, weak) DZRefreshHeader *refreshHeader;

@end

@implementation DZWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.CssMode = WebCSS_Default;
        [self comfigBaseWebView];
    }
    return self;
}

- (instancetype)initDeviceModeWithFrame:(CGRect)frame
{
    WKWebViewConfiguration * wkWebConfig = [self baseWebViewConfig];
    self = [super initWithFrame:frame configuration:wkWebConfig];
    if (self) {
        self.CssMode = WebCSS_DeviceW;
        [self comfigBaseWebView];
    }
    return self;
}

-(void)comfigBaseWebView{
    self.UIDelegate = self;
    self.navigationDelegate = self;
    self.backgroundColor = KRandom_Color;
    self.urlCenter = [[DZWebUrlCenter alloc] init];
    self.jsBridge = [WebViewJavascriptBridge bridgeForWebView:self];
    [self.jsBridge setWebViewDelegate:self];
}

-(void)setIsHeaderRefresh:(BOOL)isHeaderRefresh{
    _isHeaderRefresh = isHeaderRefresh;
    if (isHeaderRefresh) {
        self.scrollView.mj_header = self.refreshHeader;
    }else{
        self.scrollView.mj_header = nil;
    }
}

/**
 *  loading view 中间
 */
-(void)setIsActionLoading:(BOOL)isActionLoading{
    _isActionLoading = isActionLoading;
    if (isActionLoading) {
        m_actView = [[LoadingAniView alloc] initWithSuperView:self loadingType:PRLoadingViewNoramlType];
    }else{
        m_actView = nil;
    }
}

- (void)refreshHeaderAction
{
    m_isWebReload = YES;
    [self startLoadRequest:self.urlLoad];
}

- (void)stopActIndicatorAnimating
{
    [m_actView stopAnimationView];
}

- (void)completeProgress
{
    if (m_actView) {
        [self stopActIndicatorAnimating];
    }
}

/**
 *  失败页重试按钮代理方法
 */
- (void)tryAgainButtonDidClicked
{
    [self.errorView removeFromSuperview];
    [m_actView startAnimationViewWithSuperView:self];
    [self reloadBtnAction];
}

- (void)removeErrorView
{
    if (_errorView)
    {
        [_errorView removeFromSuperview];
        self.errorView = nil;
    }
}

- (void)reloadBtnAction
{
    if ([DZMobileCtrl connectedNetwork]) {
        [self startLoadRequest:self.urlLoad];
        return;
    } else {
        //防止没网络的情况下,点"重试"页面变白
        [self handleFailureWebView];
        [m_actView stopAnimationView];
        return;
    }
}

-(void)startLoadRequest:(NSString *)urlStr
{
    if (self.isLoading) {
        [self stopLoading];
    }
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

-(void)handleFailureWebView
{
    [self addErrorView];
}

- (PRNetWorkErrorView *)errorView
{
    if (!_errorView) {
        CGRect errorRect = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        _errorView = [[PRNetWorkErrorView alloc] initWithFrame:errorRect viewType:PRErrorViewNoNet];
        _errorView.delegate = self;
    }
    return _errorView;
}

//加载失败页 PRErrorViewType
- (void)addErrorView {
    [self.errorView addErrorViewWithViewType:PRErrorViewNoNet];
    [self addSubview:self.errorView];
}

- (void)checkRestartLoadingAnimation
{
    if (self.refreshHeader) {
        [self.refreshHeader checkRestartLoadingAnimation];
    }
}

- (void)doneLoadingTableViewData
{
    m_isWebReload = NO;
    if (self.refreshHeader.isRefreshing) {
        [self.refreshHeader endRefreshing];
    }
}

- (void)removeRefreshHeaderView
{
    if (self.refreshHeader) {
        self.refreshHeader.hidden = YES;
    }
}

#pragma mark   /********************* 对外的接口方法 *************************/

- (void)dz_loadBaseWebUrl:(NSString *)urlString back:(backStringBlock)backBlock{
    // 无数据的时候显示
    if (![urlString isUrlContainDomain] && ![urlString hasPrefix:@"file://"]) {
        backBlock ? backBlock(@"网络地址异常或不存在，请稍后重试") : nil;
        return;
    }
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (void)dz_registerHandler:(NSString*)handlerName handler:(WVJBHandler)handler{
    [self.jsBridge registerHandler:handlerName handler:handler];
}

#pragma mark   /********************* WKUIDelegate *************************/

- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return webView;
}

#pragma mark   /********************* WKNavigationDelegate *************************/
/*
 WKNavigationDelegate主要处理一些跳转、加载处理操作，WKUIDelegate主要处理JS脚本，确认框，警告框等
 */
// 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didDecidePolicy:)]) {
        BOOL isAllow = [self.WKBaseDelegate dz_mainwebView:self didDecidePolicy:navigationAction];
        WKNavigationActionPolicy naviPolicy = isAllow ? WKNavigationActionPolicyAllow : WKNavigationActionPolicyCancel;
        decisionHandler(naviPolicy);
        return;
    }
    
    [self removeErrorView];
    
    BOOL allowAjax = [self.urlCenter processWebviewWithReqString:navigationAction.request.URL.absoluteString];
    if(allowAjax){
        decisionHandler(WKNavigationActionPolicyAllow);
    }else{
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

// 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    
    if (!m_isWebReload){
        [m_actView startAnimationViewWithSuperView:self];
    }
    
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didStartNavigation:)]) {
        [self.WKBaseDelegate dz_mainwebView:self didStartNavigation:navigation];
    }
}

// 接收到服务器跳转请求即服务重定向时之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    KSLog(@"WBS--> didReceiveServerRedirectForProvisionalNavigation");
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;{
    
    [self stopActIndicatorAnimating];
    if (error.code == NSURLErrorCancelled) {
        return; // this is Error -999
    } else {
        NSString *errorFailingURLStringKey = [error.userInfo stringForKey:@"NSErrorFailingURLStringKey"];
        if ([errorFailingURLStringKey hasPrefix:@"http"]) {
            if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didLoadMainTitle:)]) {
                [self.WKBaseDelegate dz_mainwebView:self didLoadMainTitle:@"网页连接失败"];
            }
            [self handleFailureWebView];
        }
    }
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didCommitNavigation:)]) {
        [self.WKBaseDelegate dz_mainwebView:self didCommitNavigation:navigation];
    }
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    [self stopActIndicatorAnimating];
    
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didFinishNavigation:)]) {
        [self.WKBaseDelegate dz_mainwebView:self didFinishNavigation:navigation];
    }
    self.urlLoad = webView.URL.absoluteString;
    /// 屏蔽掉长摁出现的编辑菜单
    [webView evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';" completionHandler:nil];
    [webView evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none';" completionHandler:nil];
    
    // 保存Cookie
    [self inner_SavewebViewCookie:webView navigation:navigation];
    
    //  回调给外层逻辑处理
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didLoadMainTitle:)]) {
        [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
            if (!error && [title isKindOfClass:[NSString class]]) {
                NSString* webViewTitle = [NSString decodeString:title];
                [self.WKBaseDelegate dz_mainwebView:self didLoadMainTitle:webViewTitle];
            }
        }];
    }
}
//提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
    [self stopActIndicatorAnimating];
    
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didFailNavigation:withError:)]) {
        [self.WKBaseDelegate dz_mainwebView:self didFailNavigation:navigation withError:error];
    }
    
    if ([self.WKBaseDelegate respondsToSelector:@selector(dz_mainwebView:didLoadMainTitle:)]) {
        [self.WKBaseDelegate dz_mainwebView:self didLoadMainTitle:@"网页提交错误"];
    }
}

//进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    
}

#pragma mark   /********************* 交互逻辑 *************************/
- (void)dealloc{
    [self loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@""]]];
    [self cleanWebChache];
}

- (void)cleanWebChache {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)inner_SavewebViewCookie:(WKWebView *)webView navigation:(WKNavigation *)navigation{
    // iOS11 系统需要 转存Wk的cookie
    if (@available(iOS 11.0, *)) {
        WKHTTPCookieStore *cookieStore = webView.configuration.websiteDataStore.httpCookieStore;
        [cookieStore getAllCookies:^(NSArray* cookies) {
            NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
            [storage setCookies:cookies forURL:webView.URL mainDocumentURL:[NSURL URLWithString:@"516680.com"]];
        }];
    }
}


#pragma mark   /********************* 初始化配置 *************************/

-(WKWebViewConfiguration *)baseWebViewConfig{
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = wkUController;
    return wkWebConfig;
}

-(DZRefreshHeader *)refreshHeader{
    if (!_refreshHeader) {
        _refreshHeader = [DZRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeaderAction) mode:DZRefreshHeaderModeDefault];
    }
    return _refreshHeader;
}


@end







