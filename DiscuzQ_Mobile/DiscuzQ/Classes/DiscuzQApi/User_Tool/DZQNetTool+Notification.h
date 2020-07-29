//
//  DZQNetTool+Notification.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  通知

#import "DZQNetTool.h"
#import "DZQNotiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Notification)

/// 消息列表
/// @param query queryUrl
-(void)dz_notiListWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 通知消息删除
/// @param query filter
-(void)dz_notiDeleteWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
