//  
//  DZQDelegate.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/7/12.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZQDelegate.h"
//#import <UMShare/UMShare.h>
#import "AppDelegate+Config.h"

#define _IPHONE80_ 80000

@implementation DZQDelegate

static DZQDelegate *m_appDelegate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = KWhite_Color;
    m_appDelegate = self;
    
    DZRootTabBarController * rootVC = [[DZRootTabBarController alloc] init];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    [self Config_WhenAppDidFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

#pragma mark - Status bar 点击tableview滚到顶部
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    CGPoint location = [[[event allTouches] anyObject] locationInView:self.window];
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    if (CGRectContainsPoint(statusBarFrame, location)) {
        [[NSNotificationCenter defaultCenter] postNotificationName:DZ_StatusBarTap_Notify object:nil];
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    self.isOpenUrl = YES;
    return YES;
}

+ (DZQDelegate *)appDelegate {
    return m_appDelegate;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    KSLog(@"内存警告了");
    
}

/// 在这里写支持的旋转方向，为了防止横屏方向，应用启动时候界面变为横屏模式
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    // 可以这么写
    if (self.allowOrentitaionRotation) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}


//-(BOOL)application:(UIApplication*)application handleOpenURL:(NSURL *)url
//{
//    BOOL result =[[UMSocialManager defaultManager] handleOpenURL:url];
//    if(!result){
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}

// 支持所有iOS系统
//-(BOOL)application:(UIApplication*)application openURL:(NSURL *)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
//{
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result =[[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if(!result){
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}

//-(BOOL)application:(UIApplication*)application continueUserActivity:(NSUserActivity*)userActivity restorationHandler:(void(^)(NSArray* __nullable restorableObjects))restorationHandler
//{
//    if(![[UMSocialManager defaultManager] handleUniversalLink:userActivity options:nil]){
//        // 其他SDK的回调
//    }
//    return YES;
//}

@end
