//
//  DZSDKShareCenter.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/11/28.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZSDKShareCenter : NSObject

// 单例
+ (nonnull instancetype)shareInstance;

/*
 *  设置shareSDK参数
 */
- (void)setupShareConfigure;
- (void)shareText:(nonnull NSString *)text andImages:(nullable id)images andUrlstr:(nonnull NSString *)urlStr andTitle:(nonnull NSString *)title andView:(nullable UIView *)view andHUD:(nullable MBProgressHUD *)HUD;

#pragma mark - qq登录
- (void)loginWithQQSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish;

#pragma mark - 微信登录
- (void)loginWithWeiXinSuccess:(void(^_Nullable)(id _Nullable postData,id _Nullable getData))success finish:(void(^_Nullable)(void))finish;

@end
