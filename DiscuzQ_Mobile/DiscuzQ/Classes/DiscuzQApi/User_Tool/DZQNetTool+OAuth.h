//
//  DZQNetTool+OAuth.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQAuthModel.h"
#import "DZOtherRelationModel.h"

@interface DZQNetTool (OAuth)

/// 退出登录
-(void)dz_loginOutWithCompletion:(PRNoneBlock)completion;

/// 用户注册
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
/// @param code 注册邀请码
-(void)dz_registerWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile code:(NSString *)code success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户登录
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
-(void)dz_loginWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 用户刷新 token 接口
/// @param refresh_token *刷新令牌
/// @param scope 范围权限列表
/// @param client_secret 客户的秘钥
/// @param client_id 客户的 ID
-(void)dz_refreshUserToken:(NSString *)refresh_token scope:(NSArray *)scope client_id:(NSString *)client_id client_secret:(NSString *)client_secret success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;
    
    
    
    
    
    
    
    
    
@end


