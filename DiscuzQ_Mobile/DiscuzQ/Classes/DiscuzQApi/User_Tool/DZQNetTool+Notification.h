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
/// @param queryUrl queryUrl
/// 消息列表
/// @param filter filter
//    通知类型
//    默认不传查全部
//    system 系统通知
//    replied 回复我的
//    liked 点赞我的
//    rewarded 打赏我的
//    related @我的
-(void)dz_notiListWithTypeFilter:(NSString * _Nullable )filter success:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end

NS_ASSUME_NONNULL_END
