//
//  DZQBaseUserV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQUserRelationV1.h"

@interface DZQBaseUserV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *username;  //!< 属性注释
@property (nonatomic, copy) NSString *avatarUrl;  //!< 属性注释
@property (nonatomic, assign) BOOL isReal;  //!< 属性注释

@property (nonatomic, assign) NSInteger threadCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger followCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger fansCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger likedCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger questionCount;  //!< 属性注释
@property (nonatomic, copy) NSString *signature;  //!< 属性注释
@property (nonatomic, assign) NSInteger usernameBout;  //!< 用户名修改次数
@property (nonatomic, assign) NSInteger follow;  //!< 关注状态： null 未登录/登陆用户与查询用户相同 0 未关注 1 已关注 2 互相关注
@property (nonatomic, assign) NSInteger status;  //!< 状态

@property (nonatomic, copy) NSString *loginAt;  //!< 属性注释
@property (nonatomic, copy) NSString *joinedAt;  //!< 属性注释
@property (nonatomic, copy) NSString *expiredAt;  //!< 属性注释
@property (nonatomic, copy) NSString *createdAt;  //!< 属性注释
@property (nonatomic, copy) NSString *updatedAt;  //!< 属性注释


@property (nonatomic, assign) BOOL canEdit;  //!< 属性注释
@property (nonatomic, assign) BOOL canDelete;  //!< 属性注释
@property (nonatomic, assign) BOOL showGroups;  //!< 属性注释
@property (nonatomic, copy) NSString *registerReason;  //!< 属性注释
@property (nonatomic, copy) NSString *banReason;  //!< 属性注释

@property (nonatomic, assign) BOOL denyStatus;  //!< 属性注释
@property (nonatomic, assign) BOOL canEditUsername;  //!< 属性注释


@end


@interface DZQDataUser : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQBaseUserV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQUserRelationV1 *relationships;    //!< 属性注释

@end
