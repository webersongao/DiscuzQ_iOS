//
//  DZQNetTool+Group.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQGroupModel.h"
#import "DZQPermissionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Group)

/// 用户组 列表
/// @param query query
-(void)dz_userGroupListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
