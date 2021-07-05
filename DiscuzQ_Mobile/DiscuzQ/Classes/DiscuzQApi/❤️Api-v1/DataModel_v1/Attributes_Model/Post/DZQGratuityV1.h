//
//  DZQGratuityV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
///  悬赏问答（每个人都可以回答的那种悬赏 问答）

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN
@class DZQGratuityRelationV1;
@interface DZQGratuityV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *inner_id;  //!< 问答扩展表主键ID
@property (nonatomic, copy) NSString *thread_id;  //!< 帖子ID
@property (nonatomic, copy) NSString *post_id;  //!< 帖子关联的posts表ID
@property (nonatomic, assign) NSInteger type;  //!< 问答帖类型，0为所有人可回答的悬赏帖，1为指定人问答帖(原有的问答帖)
@property (nonatomic, copy) NSString *user_id;  //!< 作者ID (提问者)
@property (nonatomic, copy) NSString *answer_id;  //!< 回答者ID，当为悬赏帖时，这里为空
@property (nonatomic, assign) float money;  //!< 问答金额/悬赏金额
@property (nonatomic, assign) float remain_money;  //!< 剩余金额
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *expired_at;  //!< 过期时间

@end


@interface DZQDataGratuity : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQGratuityV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQGratuityRelationV1 *relationships;    //!< 属性注释

@end

NS_ASSUME_NONNULL_END
