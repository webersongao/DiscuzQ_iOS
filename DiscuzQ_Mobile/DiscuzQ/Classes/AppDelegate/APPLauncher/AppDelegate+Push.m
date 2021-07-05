//
//  DZQDelegate+Push.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "AppDelegate+Push.h"
#import "DZPushCenter.h"

@implementation DZQDelegate (Push)

// 连接信鸽
- (void)launchPushConfigration:(NSDictionary *)launchOptions {
    
    // 注册通知,信鸽注册设备
//    [[DZPushCenter Shared] Reregistration];
//    // 信鸽启动APP时收到消息
//    if (launchOptions) {
//        [self xingeGetPushLunch:launchOptions];
//    }
      //角标清0
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
//
//    //清除所有通知(包含本地通知)
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    [[DZPushCenter Shared] configPush];
}

/*
#pragma mark - 信鸽推送收到（APP启动）
- (void)xingeGetPushLunch:(NSDictionary *)launchOptions {
//    NSDictionary* pushNotificationKey =[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//
//    if (pushNotificationKey) {
//        [[DZPushCenter Shared] getNotiToview:pushNotificationKey];
//        //这里定义自己的处理方式
//        [[DZPushCenter Shared] receiveNotificationFeeback:pushNotificationKey];
//    } else {
//        [[DZPushCenter Shared] cancelPushBadge];
//    }
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    //notification是发送推送时传入的字典信息
//    [XGPush localNotificationAtFrontEnd:notification userInfoKey:@"clockID" userInfoValue:@"myid"];
//
//    //删除推送列表中的这一条
//    [XGPush delLocalNotification:notification];
    //[XGPush delLocalNotification:@"clockID" userInfoValue:@"myid"];
    //清空推送列表
    //[XGPush clearLocalNotifications];
}


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= _IPHONE80_
//注册UserNotification成功的回调
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //用户已经允许接收以下类型的推送
    //UIUserNotificationType allowedTypes = [notificationSettings types];
    
}

//按钮点击事件回调
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)(void))completionHandler{
    if([identifier isEqualToString:@"ACCEPT_IDENTIFIER"]){
        KSLog(@"ACCEPT_IDENTIFIER is clicked");
    }
    completionHandler();
}

#endif

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //注册设备
    //    [[XGSetting getInstance] setChannel:@"掌上论坛"];
    //    XGSetting * setting = (XGSetting *)[XGSetting getInstance];
    //    [setting setChannel:@"掌上论坛"];
    //    [[XGSetting getInstance] setGameServer:@"巨神峰"];
//    void (^successBlock)(void) = ^() {
//        //成功之后的处理
//        KSLog(@"[XGPush]register successBlock");
//    };
//    
//    void (^errorBlock)(void) = ^() {
//        //失败之后的处理
//        KSLog(@"[XGPush]register errorBlock");
//    };
//    NSString * deviceTokenStr = [XGPush registerDevice:deviceToken successCallback:successBlock errorCallback:errorBlock];
//    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:DZ_PushTOKEN];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    KSLog(@"deviceTokenStr=%@",deviceTokenStr);
    //如果不需要回调
    //    NSString * deviceTokenStr = [XGPush registerDevice:deviceToken];
}

// 如果deviceToken获取不到会进入此事件
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSString *str = [NSString stringWithFormat: @"Error: %@",error];
    KSLog(@"%@",str);
}

#pragma mark - iOS10 收到推送处理(APP运行时)
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    [[DZPushCenter Shared] isActivePushAlert:notification.request.content.userInfo];
}

// (APP在后台)
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    
    [[DZPushCenter Shared] getNotiToview:response.notification.request.content.userInfo];
}

#pragma mark - 收到推送处理(APP运行时)
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        // 本来就在前台的时候
        [[DZPushCenter Shared] isActivePushAlert:userInfo];
        
    } else if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive) {
        //        点击推送通知进入界面的时候
        [[DZPushCenter Shared] getNotiToview:userInfo];
    }
    
    [[DZPushCenter Shared] receiveNotificationFeeback:userInfo];
}


*/

@end
