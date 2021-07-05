//
//  DZUserHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZUserHelper : NSObject

// 删除消息
+ (void)user_NotiCellDeleteAction:(NSString *)noti_id;

// 弹出用户邀请码
+ (void)user_createUserinviteCodeAction:(DZQBaseUserV1 *)userModel;

/// 跳转订单详情页
+ (void)user_orderDetailViewInfoAction:(DZQDataCashLog *)logModel;

// 关注
+ (void)user_HeaderCellFollowAction:(NSString *)user_id current:(BOOL)isFollow block:(backBoolBlock)backBlock;

@end

NS_ASSUME_NONNULL_END
