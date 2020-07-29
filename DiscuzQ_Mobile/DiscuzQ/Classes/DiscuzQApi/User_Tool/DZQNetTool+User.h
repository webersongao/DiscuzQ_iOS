//
//  DZQNetTool+User.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQUserModel.h"
#import "DZQProfileRelationModel.h"

@interface DZQNetTool (User)

/// 用户资料展示
/// @param userId 用户Id
/// @param include 关联数据，可选值：groups,wechat(只有当前登录用户可以使用)
-(void)dz_userInfoWithUserId:(NSString *)userId include:(NSString *)include success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户搜索
/// @param filterStr 筛选项
-(void)dz_userSearcWithFilter:(NSString *)filterStr page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 修改用户资料
-(void)dz_userInfoModifyWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

// 身份实名认证
-(void)dz_userVerifyWithUser:(NSString *)realname identityNo:(NSString *)identity success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 修改用户头像
/// @param avatarPath 头像文件
-(void)dz_userAvatarUploadWithSubCtrl:(NSString *)subCtrl file:(NSString *)avatarPath progress:(PRProgressBlock)progress success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 修改用户 支付密码
-(void)dz_userModifyPayPWDWithPayPwd:(NSString *)pay_password success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 拉黑某个用户
-(void)dz_userCreateDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 取消 拉黑某个用户
-(void)dz_userCancelDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 某个用户 的拉黑用户列表
-(void)dz_userDenyListWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;
















@end

