//
//  DZQDelegate+Push.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZQDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface DZQDelegate (Push)<UNUserNotificationCenterDelegate>


/**
 配置信鸽推送只需要这个方法，放在didFinishLaunchingWithOptions里面

 @param launchOptions 进入程序的时候传入
 */
- (void)launchPushConfigration:(NSDictionary *)launchOptions;

@end
