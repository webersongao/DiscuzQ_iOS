//
//  DZQNetTool+Notification_V3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQNetTool (Notification_V3)

/// 消息列表
/// @param query queryUrl
-(void)DZQ_V3_NotiListWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;

/// 通知消息删除
/// @param query filter
-(void)DZQ_V3_NotiDeleteWithTypeQuery:(NSString * )query success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;


@end

NS_ASSUME_NONNULL_END
