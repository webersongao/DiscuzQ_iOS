//
//  DZPushCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 19/12/25.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZPushCenter : NSObject

+ (instancetype)Shared;

/** 配置推送*/
- (void)configPush;

/** 收到推送后跳到某页 */
- (void)getNotiToview:(NSDictionary *)userInfo;

/** 本来就在前台的时候 */
- (void)isActivePushAlert:(NSDictionary *)userInfo;

/** 角标清0 */
- (void)cancelPushBadge;

/** 回调版本示例 */
- (void)receiveNotificationFeeback:(NSDictionary *)userInfo;

/** 推送注册 */
- (void)Reregistration;

@end
