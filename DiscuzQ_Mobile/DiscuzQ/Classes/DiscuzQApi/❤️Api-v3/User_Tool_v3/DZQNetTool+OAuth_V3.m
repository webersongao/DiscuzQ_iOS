//
//  DZQNetTool+OAuth_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+OAuth_V3.h"

@implementation DZQNetTool (OAuth_V3)


/// 用户注册
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
/// @param code 注册邀请码
-(void)DZQ_V3_RegisterWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile code:(NSString *)code success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserRegister,nil,nil);
    NSDictionary *paraDict = @{@"username":DZQStrNull(username),@"password":DZQStrNull(password),@"token":DZQStrNull(token),@"mobile":DZQStrNull(mobile),@"code":DZQStrNull(code),@"register_reason":DZQ_Client};
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserRegister, @"register") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
}


/// 用户登录
/// @param username *用户名
/// @param password *密码
/// @param token 微信登录绑定 token
/// @param mobile 手机号
-(void)DZQ_V3_LoginWithName:(NSString *)username password:(NSString *)password token:(NSString *)token mobile:(NSString *)mobile success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserLogin,nil,nil);
    NSDictionary *dataDict = @{@"username":DZQStrNull(username),@"password":DZQStrNull(password),@"token":DZQStrNull(token),@"mobile":DZQStrNull(mobile)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserLogin, @"login") completion:^(DZQBaseRes *resModel) {
            // 保存 token 到SDK，以便后面在 HTTPHeader中使用
            DZQResV1 *resV1Model = (DZQResV1 *)resModel;
            DZQTokenV1 *token = (DZQTokenV1 *)resV1Model.dataBody.firstObject.attributes;
            [weakQSelf updateDZQSDKToken:token];
            if (success) {
                success(resModel,resModel.success);
            }
        }];
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
}

/// 用户刷新 token 接口
/// @param refresh_token *刷新令牌
/// @param scope 范围权限列表
/// @param client_secret 客户的秘钥
/// @param client_id 客户的 ID
-(void)DZQ_V3_RefreshUserToken:(NSString *)refresh_token scope:(NSArray *)scope client_id:(NSString *)client_id client_secret:(NSString *)client_secret success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserRefreshToken,nil,nil);
    NSString *scopeString = [scope jsonStringEncoded];
    NSDictionary *paraDict = @{@"refresh_token":DZQStrNull(refresh_token),@"grant_type":@"refresh_token",@"scope":DZQStrNull(scopeString),@"client_secret":DZQStrNull(client_secret),@"client_id":DZQStrNull(client_id)};
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserRefreshToken, @"refreshToken") completion:^(DZQBaseRes *resModel) {
            if (success) {
                success(resModel,resModel.success);
            }
        }];
        
    } failure:^(PRError *error) {
        if (failure) {
            failure([DZQResError errorBodyWithError:error]);
        }
    } cancel:nil];
}










@end
