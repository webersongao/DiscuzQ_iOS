//
//  DZQOrderV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQOrderRelationV1.h"

NS_ASSUME_NONNULL_BEGIN

// 需要继承自 DZQSuperAttribute

@interface DZQOrderV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *order_sn;  //!< 订单唯一编号
@property (nonatomic, assign) float amount;  //!< 订单付款金额
@property (nonatomic, assign) NSInteger status;  //!< 付款状态，0 待付款，1 已付款 ，2 取消订单，3 支付失败，4 订单已过期
@property (nonatomic, assign) NSInteger type;  //!<  订单类型 1：注册，2：打赏，3：付费主题，4：付费用户组
@property (nonatomic, copy) NSString *thread_id;  //!< 打赏的主题
@property (nonatomic, copy) NSString *group_id;  //!< 付费用户组 id
@property (nonatomic, copy) NSString *title;  //!< 主题不为空时，标题不为空
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间


@end


@interface DZQDataOrder : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQOrderV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQOrderRelationV1 *relationships;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
