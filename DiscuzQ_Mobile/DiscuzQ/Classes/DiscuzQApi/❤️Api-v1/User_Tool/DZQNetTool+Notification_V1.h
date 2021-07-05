//
//  DZQNetTool+Notification_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  通知

#import "DZQNetTool.h"
#import "DZQNotiV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Notification_V1)

/// 消息列表
/// @param query queryUrl
-(void)DZQ_V1_NotiListWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 通知消息删除
/// @param query filter
-(void)DZQ_V1_NotiDeleteWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
