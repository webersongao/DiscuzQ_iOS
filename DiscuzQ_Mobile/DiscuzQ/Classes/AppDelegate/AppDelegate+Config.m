//
//  DZQDelegate+Config.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "DZRootTabBarController.h"

@implementation DZQDelegate (Config)


-(void)Config_WhenAppDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
//    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:60];
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO
    // 注册监听键盘是否弹起
    [DZMonitorKeyboard Shared];
    
    
    if (![self isFirstInstall]) {
        // 设置 自动登录 cookie等
        [[DZMobileCtrl sharedCtrl] localUserAutoLogin];
        [self checkAppDZVersionUpdate];
    }
    
    // 开启拉取全局配置参数
    [self Global_loadForumGlobalInfofromServer];
    
    // 设置开机启动画面
    [self loadAppLaunchScreenView];
    
    [self initCacheConfigure];
    
    // 启动骨架屏
    [[TABAnimated sharedAnimated] initWithOnlySkeleton];
    #ifndef MACRO_PRODUCT // 如果是测试环境
    [TABAnimated sharedAnimated].openLog = YES;
    #endif
    
    //    [NSThread sleepForTimeInterval:1];
    [self launchSDKConfigWithOptions:launchOptions];
    
}


- (void)initCacheConfigure {
    
    //    SDWebImageDownloaderConfig *coonfig = [[SDWebImageDownloaderConfig alloc] init];
    //    coonfig.downloadTimeout = 10;
    //    coonfig.maxConcurrentDownloads = 6;
    //    coonfig.executionOrder = SDWebImageDownloaderLIFOExecutionOrder;
    //   SDWebImageDownloader *downloader = [[SDWebImageDownloader alloc] initWithConfig:coonfig];
    //    // 设置图片缓存信息
    //
    //    SDImageCacheConfig *cacheConfig = [[SDImageCacheConfig alloc] init];
    //    cacheConfig.maxCacheAge = 7 * 24 * 60 * 60; //7天
    //    cacheConfig.maxCacheSize = 1024 * 1024 * 100; //100MB
    //    cacheConfig.maxMemoryCost = 1024 * 1024 * 40; //40MB
}

- (BOOL)isFirstInstall {
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]) {
        return YES;
    }
    return NO;
}

@end
