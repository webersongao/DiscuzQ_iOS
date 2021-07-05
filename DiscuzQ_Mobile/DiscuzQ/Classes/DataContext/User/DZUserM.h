//
//  DZUserM.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootModel.h"

@interface DZUserM : DZRootModel

// User 信息
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *username;  //!< 属性注释
@property (nonatomic, copy) NSString *avatarUrl;  //!< 属性注释
@property (nonatomic, assign) BOOL isReal;  //!< 属性注释

@property (nonatomic, assign) NSInteger threadCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger followCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger fansCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger follow;  //!< 属性注释
@property (nonatomic, assign) NSInteger status;  //!< 属性注释

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

@property (nonatomic, copy) NSString *paid;  //!< 属性注释
@property (nonatomic, copy) NSString *payTime;  //!< 属性注释

@property (nonatomic, assign) NSInteger unreadNotifications;  //!< 属性注释
@property (nonatomic, strong) DZQUnReadV1 *typeUnreadNotis;  //!< 未读消息模型model


// Token 信息
@property (nonatomic, strong) DZQTokenV1 *tokenModel;  //!< 登录验证 Token信息Model


-(BOOL)isUserLogin;

+ (instancetype)user_modelWithDictionary:(NSDictionary *)dictionary;

+(instancetype)configUserModel:(NSDictionary *)dataDict token:(NSDictionary *)tokenDict;


@end







