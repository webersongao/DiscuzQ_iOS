//
//  DZBaseUrlController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/4/29.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZBaseUrlController.h"
#import "DZSnapPreviewController.h"
#import "UIAlertController+WKWebAlert.h"
#import "UIAlertController+Extension.h"

@interface DZBaseUrlController ()<DZWebViewDelegate>

@property (nonatomic,strong) DZWebView *webView;

@end

@implementation DZBaseUrlController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DZ_StatusBarTap_Notify object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    KWEAKSELF
    [_webView dz_loadBaseWebUrl:_urlString back:^(NSString *String) {
        [UIAlertController alertTitle:nil message:String controller:self doneText:@"返回" cancelText:nil doneHandle:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } cancelHandle:nil];
    }];
    
    [self configNaviBar:@"navi_dzMore" type:NaviItemImage Direction:NaviDirectionRight];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarTappedAction:) name:DZ_StatusBarTap_Notify object:nil];
}

// 点击状态栏到顶部
- (void)statusBarTappedAction:(NSNotification*)notification {
    [self.webView.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


#pragma mark DZWebViewDelegate

- (void)dz_mainwebView:(DZWebView *)webView didLoadMainTitle:(NSString *)title{
    self.title = title;
}

- (void)dz_mainwebView:(DZWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
}


- (void)dz_mainwebView:(DZWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:webView.URL];
    NSEnumerator *enumerator = [cookies objectEnumerator];
    NSHTTPCookie *cookie;
    while (cookie = [enumerator nextObject]) {
        KSLog(@"WBS -- COOKIE{name: %@, value: %@}", [cookie name], [cookie value]);
    }
    [self.HUD hideAnimated:YES];
}

- (void)dz_mainwebView:(DZWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    [self.HUD hideAnimated:YES];
    if (error.code == NSURLErrorCancelled) {
        //忽略这个错误。
        return ;
    }
    [_webView setHidden:YES];
    [UIAlertController alertTitle:nil message:[error localizedDescription] controller:self doneText:@"返回" cancelText:nil doneHandle:^{
        [self.navigationController popViewControllerAnimated:YES];
    } cancelHandle:nil];
}




- (DZWebView *)webView {
    if (_webView == nil) {
        _webView = [[DZWebView alloc] initWithFrame:KView_OutNavi_Bounds];
//       _webView = [[DZWebView alloc] initDeviceModeWithFrame:KView_OutNavi_Bounds];
        _webView.backgroundColor = KWhite_Color;
        _webView.userInteractionEnabled = YES;
        _webView.WKBaseDelegate = self;
        [_webView setOpaque:NO];
    }
    return _webView;
}

-(void)rightBarBtnClick:(UIButton *)button{
    
    KWEAKSELF
    NSMutableArray *buttonTitleArray = [NSMutableArray array];
    [buttonTitleArray addObjectsFromArray:@[@"safari打开", @"复制链接", @"刷新"]];
    [[DZMobileCtrl sharedCtrl].moreMenu showSheetMenuInViewCtrl:self title:@"" message:nil buttonTitleArray:buttonTitleArray buttonTitleColorArray:nil popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
    } block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger index)
     {
        NSString *URlString = checkNull(weakSelf.urlString);
        if (URlString.length <= 0){
            [UIAlertController dz_AlertWithTitle:@"提示" message:@"无法获取当前链接" completion:nil];
            return;
        }
        if (index == 0){
            /*! safari打开 */
            [self safariOpenURL:[NSURL URLWithString:URlString]];
        }else if (index == 1){
            /*! 复制链接 */
            [UIPasteboard generalPasteboard].string = URlString;
        }else if (index == 2){
            /*! 刷新 */
            [weakSelf.webView reloadFromOrigin];
        }
    }];
}


- (void)safariOpenURL:(NSURL *)URL
{
    [[UIApplication sharedApplication] openURL:URL options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @NO} completionHandler:^(BOOL success)
     {
        if (!success) {
            [UIAlertController dz_AlertWithTitle:@"提示" message:@"打开失败" completion:nil];
        }
    }];
}

@end
