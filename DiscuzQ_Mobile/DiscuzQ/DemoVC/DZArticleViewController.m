//
//  DZArticleViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZArticleViewController.h"
#import <WebKit/WebKit.h>


@interface DZArticleViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) WKWebView *localWebView;  //!< 属性注释

@end

@implementation DZArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.localWebView];
    
    [self.localWebView loadHTMLString:self.htmlString baseURL:nil];
    
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    KSLog(@"WKWebView");
}



-(WKWebView *)localWebView{
    if (!_localWebView) {
        _localWebView = [[WKWebView alloc] initWithFrame:KView_OutNavi_Bounds configuration:[self baseWebViewConfig]];
        _localWebView.backgroundColor = KDebug_Color;
        _localWebView.navigationDelegate = self;
        _localWebView.UIDelegate = self;
    }
    return _localWebView;
}

-(WKWebViewConfiguration *)baseWebViewConfig{
    
//    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
//    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
//    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
//    [wkUController addUserScript:wkUScript];
    
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
//    wkWebConfig.userContentController = wkUController;
    return wkWebConfig;
}

//"content": "![](https://discuz.chat/static/images/logo.png)\n\n以上是logo\n\n想加入官方微信群，请扫码：\n\n![](https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS_thumb.png)\n\n加微信好友，拉入官方微信群(每隔1-2天不定时登录此微信号处理)\n\n语法如下：\n\n```\n![](https://discuz.chat/static/images/logo.png)\n\n以上是logo\n\n想加入官方微信群，请扫码：\n\n![](https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS_thumb.png)\n\n加微信好友，拉入官方微信群(每隔1-2天不定时登录此微信号处理)\n```",
//
//"contentHtml": "<p><img src=\"https://discuz.chat/static/images/logo.png\" alt=\"\"></p>\n\n<p>以上是logo</p>\n\n<p>想加入官方微信群，请扫码：</p>\n\n<p><img src=\"https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS_thumb.png\" alt=\"\"></p>\n\n<p>加微信好友，拉入官方微信群(每隔1-2天不定时登录此微信号处理)</p>\n\n<p>语法如下：</p>\n\n<pre><code>![](https://discuz.chat/static/images/logo.png)\n\n以上是logo\n\n想加入官方微信群，请扫码：\n\n![](https://discuz.chat/storage/attachment/nPcasNXDOY7A14TS_thumb.png)\n\n加微信好友，拉入官方微信群(每隔1-2天不定时登录此微信号处理)</code></pre>",


@end
