//
//  DZQFollowV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQFollowRelationV1.h"

@interface DZQFollowV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *follow_id;     //!< 自增 ID (没用)
@property (nonatomic, copy) NSString *from_user_id;  //!< 关注人 Uid
@property (nonatomic, copy) NSString *to_user_id;  //!< 被关注人 Uid
@property (nonatomic, assign) BOOL is_mutual;  //!< 互相关注：0 否 1 是
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间

@end


@interface DZQDataFollow : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQFollowV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQFollowRelationV1 *relationships;    //!< 属性注释


@end
