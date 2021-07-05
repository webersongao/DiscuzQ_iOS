//
//  DZQNetTool+User_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQUserV1.h"
#import "DZQUserRelationV1.h"

@interface DZQNetTool (User_V1)

/// 用户资料展示
/// @param userId 用户Id
/// @param include 关联数据，可选值：groups,wechat(只有当前登录用户可以使用)
-(void)DZQ_V1_UserInfoWithUserId:(NSString *)userId include:(NSString *)include success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户搜索
/// @param filterStr 筛选项
-(void)DZQ_V1_UserSearcWithFilter:(NSString *)filterStr page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 修改用户资料
-(void)DZQ_V1_UserInfoModifyWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

// 身份实名认证
-(void)DZQ_V1_UserVerifyWithUser:(NSString *)realname identityNo:(NSString *)identity success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 修改用户头像
/// @param avatarPath 头像文件
-(void)DZQ_V1_UserAvatarUploadWithSubCtrl:(NSString *)subCtrl file:(NSString *)avatarPath progress:(PRProgressBlock)progress success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 修改用户 支付密码
-(void)DZQ_V1_UserModifyPayPWDWithPayPwd:(NSString *)pay_password success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 拉黑某个用户
-(void)DZQ_V1_UserCreateDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 取消 拉黑某个用户
-(void)DZQ_V1_UserCancelDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 某个用户 的拉黑用户列表
-(void)DZQ_V1_UserDenyListWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;
















@end

