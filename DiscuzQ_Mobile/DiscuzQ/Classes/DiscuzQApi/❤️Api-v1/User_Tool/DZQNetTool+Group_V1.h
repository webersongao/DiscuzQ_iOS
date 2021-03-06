//
//  DZQNetTool+Group_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQGroupV1.h"
#import "DZQPermissionV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Group_V1)

/// 用户组 列表
/// @param query query
-(void)DZQ_V1_UserGroupListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
