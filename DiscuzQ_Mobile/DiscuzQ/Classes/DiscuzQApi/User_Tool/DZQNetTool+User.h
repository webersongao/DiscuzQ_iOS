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
/// @param nameKey 用户名 关键字
-(void)dz_userSearcWithName:(NSString *)nameKey page:(NSInteger)page success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

