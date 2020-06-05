//
//  DZNetCenter+User.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"
#import "DZQBaseToken.h"
#import "DZQUserModel.h"
#import "DZQProfileRelationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZNetCenter (User)


/// 退出登录
-(void)dzx_loginOutWithCompletion:(void (^)(void))completion;


/// 用户注册
/// @param username *用户名
/// @param password *密码
-(void)dzx_registerWithName:(NSString *)username password:(NSString *)password completion:(void (^)(DZQRegModel *varModel, BOOL success))completion;


//// 用户登录
-(void)dzx_loginWithName:(NSString *)username password:(NSString *)password mobile:(NSString *)mobile completion:(void (^)(DZQUserModel *userModel,DZQBaseToken *tokenModel,BOOL success))completion;

//// 重置密码
-(void)dzx_resetPwdWithPassword:(NSString *)password newPassword:(NSString *)newPassword password_confirmation:(NSString *)password_confirmation completion:(void (^)(DZQUserModel *varModel, BOOL success))completion;

/// 用户资料展示
/// @param userId 用户Id
/// @param isMe 是否是我 且已经登录
-(void)dzx_userInfoWithUserId:(NSString *)userId isMe:(BOOL)isMe completion:(void (^)(DZQResModel * varModel,BOOL success))completion;


/// 消息列表
//   filter: 通知类型
//    默认不传查全部
//    system 系统通知
//    replied 回复我的
//    liked 点赞我的
//    rewarded 打赏我的
//    related @我的
-(void)dzx_notiListWithTypeFilter:(NSString * _Nullable )filter completion:(void (^)(NSArray<DZQDataNoti *> *varModel, BOOL hasMore, BOOL success))completion;







@end

NS_ASSUME_NONNULL_END
