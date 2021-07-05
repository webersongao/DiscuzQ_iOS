//
//  DZQNetTool+Follow_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Follow_V3)

/// 创建关注关系
/// @param to_user_id *被关注着 id
-(void)DZQ_V3_FollowShipCreateWithUser:(NSString *)to_user_id success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


/// 删除（取消）关注关系
/// @param subCtrl *被关注着 id 关系参数
-(void)DZQ_V3_FollowShipDeleteWithSubCtrl:(NSString *)subCtrl success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 获取关注列表
-(void)DZQ_V3_FollowShipListWithQuery:(NSString *)query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
