//
//  DZQNetTool+OAuth.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+OAuth.h"


@implementation DZQNetTool (OAuth)


/// 退出登录
-(void)dz_loginOutWithCompletion:(PRNoneBlock)completion{
    
    [self updateDZQSDkToken:nil];
    [self.NetClient baidu_SetHeaderDesign:@{@"authorization":@""} manager:self.NetClient.jsonManager];
    
    if (completion) { completion(); }
    
}
/// 用户注册
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
/// @param code 注册邀请码
-(void)dz_registerWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile code:(NSString *)code success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_register,nil,nil);
    NSDictionary *paraDict = @{@"username":DZQStrNull(username),@"password":DZQStrNull(password),@"token":DZQStrNull(token),@"mobile":DZQStrNull(mobile),@"code":DZQStrNull(code),@"register_reason":DZQ_Client};
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_register, @"register") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
}


/// 用户登录
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
-(void)dz_loginWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_login,nil,nil);
    NSDictionary *dataDict = @{@"username":DZQStrNull(username),@"password":DZQStrNull(password),@"token":DZQStrNull(token),@"mobile":DZQStrNull(mobile)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_login, @"login") completion:^(DZQResModel *resModel) {
            // 保存 token 到SDK，以便后面在 HTTPHeader中使用
            DZQBaseToken *token = (DZQBaseToken *)resModel.dataBody.firstObject.attributes;
            [weakQSelf updateDZQSDkToken:token.access_token];
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
}

/// 用户刷新 token 接口
/// @param refresh_token *刷新令牌
/// @param scope 范围权限列表
/// @param client_secret 客户的秘钥
/// @param client_id 客户的 ID
-(void)dz_refreshUserToken:(NSString *)refresh_token scope:(NSArray *)scope client_id:(NSString *)client_id client_secret:(NSString *)client_secret success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_refreshToken,nil,nil);
    NSString *scopeString = [scope jsonStringEncoded];
    NSDictionary *paraDict = @{@"refresh_token":DZQStrNull(refresh_token),@"grant_type":@"refresh_token",@"scope":DZQStrNull(scopeString),@"client_secret":DZQStrNull(client_secret),@"client_id":DZQStrNull(client_id)};
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_refreshToken, @"refreshToken") completion:^(DZQResModel *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    } cancel:nil];
}












@end
