//
//  DZLoginModule.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/7.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const CookieValue;

@interface DZLoginModule : NSObject

/*
 * 判断是否登录
 */
+ (BOOL)isLogged;

/*
 *  退出登录，清空用户信息
 */
+ (void)signoutWithCompletion:(void (^)(void))completion;

/*
 * 设置自动登录状态
 */
+ (void)localUserAutoLogin;

+ (BOOL)checkLoginName:(NSString *)userName Pwd:(NSString *)password;

// 保存登录数据
+ (void)saveLoginUserData:(NSDictionary *)dataDict andHandle:(void(^)(void))handle;



@end
