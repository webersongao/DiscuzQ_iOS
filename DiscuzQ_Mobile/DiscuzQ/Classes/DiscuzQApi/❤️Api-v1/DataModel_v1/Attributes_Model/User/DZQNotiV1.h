//
//  DZQNotiV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQNotiV1 : DZQSuperAttribute

/// 通用字段
@property (nonatomic, copy) NSString *type;     //!< 通知类型
@property (nonatomic, copy) NSString *noti_id;  //!< 通知id
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *read_at;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 属性注释
@property (nonatomic, copy) NSString *user_name;  //!< 用户名
@property (nonatomic, copy) NSString *user_avatar;  //!< 头像

/// 系统通知
@property (nonatomic, copy) NSString *title;  //!< 属性注释         （系统）
@property (nonatomic, copy) NSString *content;  //!<通知内容        （系统/打赏）
@property (nonatomic, strong) NSDictionary *raw;  //!< 属性注释     （系统）

/// 点赞/回复/@通知/
@property (nonatomic, copy) NSString *post_id;  //!< 属性注释       （点赞/回复/@通知）
@property (nonatomic, copy) NSString *thread_id;  //!< 属性注释     （点赞/回复/@通知/打赏）
@property (nonatomic, copy) NSString *post_content;  //!< 属性注释  （点赞/回复/@通知）

/// 点赞/回复/打赏/
@property (nonatomic, copy) NSString *thread_title;  //!< 属性注释  （点赞/回复/@通知/打赏）
@property (nonatomic, copy) NSString *thread_created_at;  //!< 属性注释       （点赞/回复/打赏）
@property (nonatomic, copy) NSString *thread_username;  //!< 属性注释       （点赞/回复/打赏）
@property (nonatomic, copy) NSString *reply_post_id;  //!< 属性注释       （点赞/回复/打赏）
@property (nonatomic, copy) NSString *thread_user_groups;  //!< 属性注释       （点赞/回复/打赏）
@property (nonatomic, assign) NSInteger thread_is_approved;  //!< 属性注释       （点赞/回复/打赏）


/// 点赞/回复
@property (nonatomic, copy) NSString *post_created_at;  //!< 属性注释       （点赞/回复）


// 回复
@property (nonatomic, copy) NSString *reply_post_user_id;  //!< 属性注释       （回复）
@property (nonatomic, copy) NSString *reply_post_content;  //!< 属性注释       （回复）
@property (nonatomic, copy) NSString *reply_post_created_at;  //!< 属性注释       （回复）


/// 打赏
@property (nonatomic, copy) NSString *order_id;  //!< 打赏订单id    （打赏）
@property (nonatomic, assign) float amount;  //!< 打赏金额(注意小数点)      （打赏）


// 提现
@property (nonatomic, assign) float cash_actual_amount;  //!< 实际提现金额      （打赏）
@property (nonatomic, assign) float cash_apply_amount;  //!< 提现申请金额      （打赏）
@property (nonatomic, assign) NSInteger cash_status;  //!< 提现状态    1：待审核，2：审核通过，3：审核不通过，4：待打款， 5，已打款， 6：打款失败      （打赏）
@property (nonatomic, copy) NSString *remark;  //!< 拒绝原因    （打赏）





@end


@interface DZQDataNoti : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQNotiV1 *attributes;    //!< 属性注释

@end
