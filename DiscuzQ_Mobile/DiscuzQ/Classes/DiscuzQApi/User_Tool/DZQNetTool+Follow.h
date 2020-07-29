//
//  DZQNetTool+Follow.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//


#import "DZQNetTool.h"
#import "DZQFollowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Follow)

/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)dz_followShipCreateWithUser:(NSString *)to_user_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 删除（取消）关注关系
/// @param subCtrl *被关注着 id 关系参数
-(void)dz_followShipDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 获取关注列表
-(void)dz_followShipListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END

