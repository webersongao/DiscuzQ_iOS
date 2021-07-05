//
//  DZQNetTool+User_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool+User_V3.h"

@implementation DZQNetTool (User_V3)

/// 用户资料展示
/// @param userId 用户Id
/// @param include 关联数据，可选值：groups,wechat(只有当前登录用户可以使用)
-(void)DZQ_V3_UserInfoWithUserId:(NSString *)userId include:(NSString *)include success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *inclueStr = DZQStrNull(include);
    inclueStr = inclueStr.length ? DZQTwoStr(@",",inclueStr) : @"";
    
    NSString *queryStr = [NSString stringWithFormat:@"include=groups%@",inclueStr];
    NSString *ctrlStr = [NSString stringWithFormat:@"%@/%@",DZQ_V3_UserProfile,DZQStrNull(userId)];
    
    NSString *UrlString = DZQUrlCommonPara(ctrlStr,nil,queryStr);
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserProfile, @"profile") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserAvatarUploadWithSubCtrl:(NSString *)subCtrl file:(NSString *)avatarPath progress:(PRProgressBlock)progress success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    if ([subCtrl rangeOfString:@"/avatar"].location == NSNotFound) {
        subCtrl = DZQTwoStr(subCtrl, @"/avatar");
    }
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserUpAvatar,subCtrl,nil);
    NSData *fileData = [DZToolBox dz_getDataFromImage:[UIImage imageWithContentsOfFile:avatarPath]];
    
    DZQWEAKSELF
    [self.NetClient baidu_UploadReqWithUrl:UrlString parameters:nil urlTag:0 appendBodyBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:@"23253.png" fileName:@"123.jpeg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress *upProgress) {
        if (progress) {
            progress(upProgress.fractionCompleted);
        }
    } success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserUpAvatar, @"avatar") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserInfoModifyWithSubCtrl:(NSString *)subCtrl paraDict:(NSDictionary *)paraDict success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserModify,subCtrl,nil);
    
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserModify, @"modify") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserVerifyWithUser:(NSString *)realname identityNo:(NSString *)identity success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserReal,nil,nil);
    NSDictionary *dataDict = @{@"realname":DZQStrNull(realname),@"identity":DZQStrNull(identity)};
    NSDictionary *attributes = @{@"attributes":dataDict};
    NSDictionary *paraDict = @{@"data":attributes};
    DZQWEAKSELF
    [self.NetClient baidu_PatchReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserReal, @"real") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserSearcWithFilter:(NSString *)filterStr page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    page = (page <= 0) ? 1 : page;
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserSearch,nil,filterStr);
    
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserSearch, @"search") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserModifyPayPWDWithPayPwd:(NSString *)pay_password success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserResetPayPwd,@"",@"");
    NSDictionary *paraDict = @{@"pay_password":DZQStrNull(pay_password)};
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:paraDict success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserResetPayPwd, @"PayPwd") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserCreateDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserDeny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_PostReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserDeny, @"deny") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserCancelDenyWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserCancelDeny,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_DeleteReqWithUrl:UrlString urlTag:0 parameters:nil success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserCancelDeny, @"cancel") completion:^(DZQBaseRes *resModel) {
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
-(void)DZQ_V3_UserDenyListWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    NSString *UrlString = DZQUrlCommonPara(DZQ_V3_UserDenyList,subCtrl,@"");
    DZQWEAKSELF
    [self.NetClient baidu_GetReqWithUrl:UrlString urlTag:0 success:^(id response) {
        [weakQSelf.dataLogic resModelWithJSON:response urlCtrl:KDZQMapKey(DZQ_V3_UserDenyList, @"list") completion:^(DZQBaseRes *resModel) {
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
