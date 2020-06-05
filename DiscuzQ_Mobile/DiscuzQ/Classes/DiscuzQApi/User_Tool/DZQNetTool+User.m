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

/// 用户搜索
/// @param nameKey 用户名 关键字
-(void)dz_userSearcWithName:(NSString *)nameKey page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure{
    
    
}

@end
