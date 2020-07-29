//
//  DZQNetTool+User.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+User.h"

@implementation DZQNetTool (User)

/// 用户资料展示
/// @param userId 用户Id
/// @param include 关联数据，可选值：groups,wechat(只有当前登录用户可以使用)
-(void)dz_userInfoWithUserId:(NSString *)userId include:(NSString *)include success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *inclueStr = DZQStrNull(include);
    inclueStr = inclueStr.length ? DZQTwoStr(@",",inclueStr) : @"";
    
    NSString *queryStr = [NSString stringWithFormat:@"include=groups%@",inclueStr];
    NSString *ctrlStr = [NSString stringWithFormat:@"%@/%@",DZQ_User_profile,DZQStrNull(userId)];
    
    NSString *UrlString = DZQUrlCommonPara(ctrlStr,nil,queryStr);
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_profile, @"profile") completion:^(DZQResModel *resModel) {
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


/// 修改用户头像
/// @param avatarPath 头像文件
-(void)dz_userAvatarUploadWithSubCtrl:(NSString *)subCtrl file:(NSString *)avatarPath progress:(PRProgressBlock)progress success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    if ([subCtrl rangeOfString:@"/avatar"].location == NSNotFound) {
        subCtrl = DZQTwoStr(subCtrl, @"/avatar");
    }
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_UpAvatar,subCtrl,nil);
    NSData *fileData = [DZToolBox dz_getDataFromImage:[UIImage imageWithContentsOfFile:avatarPath]];
    
    DZQWEAKSELF
    [self.NetClient baidu_UploadRequestWithUrl:UrlString parameters:nil urlTag:0 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:@"23253.png" fileName:@"123.jpeg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress *upProgress) {
        if (progress) {
            progress(upProgress.fractionCompleted);
        }
    } success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_UpAvatar, @"avatar") completion:^(DZQResModel *resModel) {
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

/// 修改用户资料
-(void)dz_userInfoModifyWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_modify,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_PatchRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_UpAvatar, @"modify") completion:^(DZQResModel *resModel) {
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

// 身份实名认证
-(void)dz_userVerifyWithUser:(NSString *)realname identityNo:(NSString *)identity success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_real,nil,nil);
    NSDictionary *dataDict = @{@"realname":DZQStrNull(realname),@"identity":DZQStrNull(identity)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    [self.NetClient baidu_PatchRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_real, @"real") completion:^(DZQResModel *resModel) {
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

/// 用户搜索
/// @param filterStr 筛选项
-(void)dz_userSearcWithFilter:(NSString *)filterStr page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    page = (page <= 0) ? 1 : page;
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_search,nil,filterStr);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_search, @"search") completion:^(DZQResModel *resModel) {
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


/// 修改用户 支付密码
-(void)dz_userModifyPayPWDWithPayPwd:(NSString *)pay_password success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_resetPayPwd,@"",@"");
    NSDictionary *paraDict = @{@"pay_password":DZQStrNull(pay_password)};
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:paraDict success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_resetPayPwd, @"PayPwd") completion:^(DZQResModel *resModel) {
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


/// 拉黑某个用户
-(void)dz_userCreateDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_deny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_deny, @"deny") completion:^(DZQResModel *resModel) {
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


/// 取消 拉黑某个用户
-(void)dz_userCancelDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_cancelDeny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_DeleteRequestWithUrl:UrlString urlTag:0 parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_cancelDeny, @"cancel") completion:^(DZQResModel *resModel) {
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

/// 某个用户 的拉黑用户列表
-(void)dz_userDenyListWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_User_denyList,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_GetRequestWithUrl:UrlString urlTag:0 success:^(NSURLSessionDataTask *task, id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_User_denyList, @"list") completion:^(DZQResModel *resModel) {
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
