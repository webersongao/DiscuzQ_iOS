//
//  DZQNetTool+User_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+User_V1.h"

@implementation DZQNetTool (User_V1)

/// 用户资料展示
/// @param userId 用户Id
/// @param include 关联数据，可选值：groups,wechat(只有当前登录用户可以使用)
-(void)DZQ_V1_UserInfoWithUserId:(NSString *)userId include:(NSString *)include success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *inclueStr = DZQStrNull(include);
    inclueStr = inclueStr.length ? DZQTwoStr(@",",inclueStr) : @"";
    
    NSString *queryStr = [NSString stringWithFormat:@"include=groups%@",inclueStr];
    NSString *ctrlStr = [NSString stringWithFormat:@"%@/%@",DZQ_V1_User_profile,DZQStrNull(userId)];
    
    NSString *UrlString = DZQUrlCommonPara(ctrlStr,nil,queryStr);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_profile, @"profile") completion:^(DZQBaseRes *resModel) {
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


/// 修改用户头像
/// @param avatarPath 头像文件
-(void)DZQ_V1_UserAvatarUploadWithSubCtrl:(NSString *)subCtrl file:(NSString *)avatarPath progress:(PRProgressBlock)progress success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    if ([subCtrl rangeOfString:@"/avatar"].location == NSNotFound) {
        subCtrl = DZQTwoStr(subCtrl, @"/avatar");
    }
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_UpAvatar,subCtrl,nil);
    NSData *fileData = [DZToolBox dz_getDataFromImage:[UIImage imageWithContentsOfFile:avatarPath]];
    
    DZQWEAKSELF
    [self.NetClient baidu_UploadReqWithUrl:UrlString parameters:nil urlTag:0 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:@"23253.png" fileName:@"123.jpeg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress *upProgress) {
        if (progress) {
            progress(upProgress.fractionCompleted);
        }
    } success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_UpAvatar, @"avatar") completion:^(DZQBaseRes *resModel) {
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

/// 修改用户资料
-(void)DZQ_V1_UserInfoModifyWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_modify,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_modify, @"modify") completion:^(DZQBaseRes *resModel) {
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

// 身份实名认证
-(void)DZQ_V1_UserVerifyWithUser:(NSString *)realname identityNo:(NSString *)identity success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_real,nil,nil);
    NSDictionary *dataDict = @{@"realname":DZQStrNull(realname),@"identity":DZQStrNull(identity)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_real, @"real") completion:^(DZQBaseRes *resModel) {
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

/// 用户搜索
/// @param filterStr 筛选项
-(void)DZQ_V1_UserSearcWithFilter:(NSString *)filterStr page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    page = (page <= 0) ? 1 : page;
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_search,nil,filterStr);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_search, @"search") completion:^(DZQBaseRes *resModel) {
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


/// 修改用户 支付密码
-(void)DZQ_V1_UserModifyPayPWDWithPayPwd:(NSString *)pay_password success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_resetPayPwd,@"",@"");
    NSDictionary *paraDict = @{@"pay_password":DZQStrNull(pay_password)};
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_resetPayPwd, @"PayPwd") completion:^(DZQBaseRes *resModel) {
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


/// 拉黑某个用户
-(void)DZQ_V1_UserCreateDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_deny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_deny, @"deny") completion:^(DZQBaseRes *resModel) {
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


/// 取消 拉黑某个用户
-(void)DZQ_V1_UserCancelDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_cancelDeny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_cancelDeny, @"cancel") completion:^(DZQBaseRes *resModel) {
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

/// 某个用户 的拉黑用户列表
-(void)DZQ_V1_UserDenyListWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V1_User_denyList,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V1_User_denyList, @"list") completion:^(DZQBaseRes *resModel) {
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
