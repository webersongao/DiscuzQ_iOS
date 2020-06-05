//
//  AppDelegate+Push.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate (Push)<UNUserNotificationCenterDelegate>


/**
 配置信鸽推送只需要这个方法，放在didFinishLaunchingWithOptions里面

 @param launchOptions 进入程序的时候传入
 */
- (void)launchPushConfigration:(NSDictionary *)launchOptions;

@end
