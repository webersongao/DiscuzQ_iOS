//
//  DZWebCodeView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  https://www.jianshu.com/p/c827ec7836e4

#import "DZWebCodeView.h"

NSString *const KCaptchaHoler = @"Gao->captcha<-Gao";


@implementation DZVerifyResultModel

@end

@interface DZWebCodeView ()

@property (nonatomic, copy) NSString *siteAppid;
@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, copy) backSizeBlock sizeCallback;
@property (nonatomic, copy) backNoneBlock dismissCallback;
@property (nonatomic, copy) DZVerifyBlock verifyEndCallback;

@end

@implementation DZWebCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.webView];
    self.siteAppid = [DZMobileCtrl sharedCtrl].instance.siteModel.qcloud.qcloud_captcha_app_id;
}

- (void)dismissViewAction {
    if (self.dismissCallback) {
        self.dismissCallback();
    }
}

// 加载入口方法
- (void)loadTXCaptchaWithSizeBlock:(backSizeBlock)sizeBlock Completion:(DZVerifyBlock)completion disMiss:(backNoneBlock)dismissBlock{
    self.sizeCallback = sizeBlock;
    self.dismissCallback = dismissBlock;
    self.verifyEndCallback = completion;
    
    NSString *randomstr = [self randomPassword];
    NSString* htmlText = [NSString stringWithFormat:[self localWebBridge_Html_jsString], randomstr];
    [self.webView loadHTMLString:htmlText baseURL:nil];
}

-(NSString *)localWebBridge_Html_jsString{
    
    NSString *localJsString = DSWebBridge_html_js();
    NSString *localHtmlString = [localJsString stringByReplacingOccurrencesOfString:KCaptchaHoler withString:self.siteAppid];
    
    return localHtmlString;
}

//自动生成8位随机密码
-(NSString *)randomPassword{
    NSTimeInterval random = [NSDate timeIntervalSinceReferenceDate];
    NSString *randomString = [[NSString stringWithFormat:@"%.8f",random] md5String];
    NSString *randompassword = [randomString substringWithRange:NSMakeRange(6, 8)];
    return randompassword;
}

//js调用原生回调
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"loadAction"]) {
        //加载成功, 更新webview的frame
        NSDictionary *jsData =  message.body;
        self.webView.frame = CGRectMake(0, 0, [jsData[@"sdkView"][@"width"] doubleValue], [jsData[@"sdkView"][@"height"] doubleValue]);
        if (self.sizeCallback) {
            self.sizeCallback(self.webView.size);
        }
        self.webView.center = CGPointMake(self.width/2, self.height/2);
    }else if([message.name isEqualToString:@"verifiedAction"]) {
        //划动验证
        DZVerifyResultModel *model = [DZVerifyResultModel DZQ_ModelWithJSON:message.body];
        if (model.ret == 0) {//验证成功
            !self.verifyEndCallback ?: self.verifyEndCallback(model);
        }else if (model.ret == 2) {
            // 点击关闭 无序返回
        }
        [self dismissViewAction];
    }else if([message.name isEqualToString:@"errorAction"]) {//加载失败
        !self.verifyEndCallback ?: self.verifyEndCallback(nil);
    }
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = [WKUserContentController new];
        //注册果断回调方法
        [configuration.userContentController addScriptMessageHandler:self name:@"loadAction"];
        [configuration.userContentController addScriptMessageHandler:self name:@"errorAction"];
        [configuration.userContentController addScriptMessageHandler:self name:@"verifiedAction"];
        
        WKWebView* webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
        webView.navigationDelegate = self;
        _webView = webView;
    }
    return _webView;
}

NSString * DSWebBridge_html_js() {
#define __wvjb_js_func__(x) #x
    static NSString * html = @__wvjb_js_func__(
                                               <!DOCTYPE html>
                                               <html>
                                               <head>
                                               <script  src="https://ssl.captcha.qq.com/TCaptcha.js?v=%@" type="text/javascript"></script>
                                               <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
                                               </head>
                                               <body>
                                               <script type="text/javascript">
                                               (function(){
        // 验证成功返回ticket
        window.SDKTCaptchaVerifyCallback = function (retJson) {
            if (retJson){
                window.webkit.messageHandlers.verifiedAction.postMessage(retJson)
            }
        };
        // 验证码加载完成的回调，用来设置webview尺寸
        window.SDKTCaptchaReadyCallback = function (retJson) {
            if (retJson && retJson.sdkView && retJson.sdkView.width && retJson.sdkView.height &&  parseInt(retJson.sdkView.width) >0 && parseInt(retJson.sdkView.height) >0 ){
                window.webkit.messageHandlers.loadAction.postMessage(retJson)
            }
        };
        window.onerror = function (msg, url, line, col, error) {
            if (window.TencentCaptcha == null) {
                window.webkit.messageHandlers.errorAction.postMessage(error)
            }
        };
        var sdkOptions = {"sdkOpts": {"width": 265, "height": 265}};
        sdkOptions.ready = window.SDKTCaptchaReadyCallback;
        window.onload = function () {
            //此处需要替换appid为 腾讯云验证码Appid
            new TencentCaptcha("Gao->captcha<-Gao", SDKTCaptchaVerifyCallback, sdkOptions).show();
        };
    })();
                                               </script></body></html>
                                               );
#undef __wvjb_js_func__
    return html;
};

@end
