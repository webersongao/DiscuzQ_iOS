//
//  DZUserModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "EFSQLiteObject.h"

@interface DZUserModel : EFSQLiteObject

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


// Token 信息

@property (nonatomic, copy) NSString *token_type;  //!< token 类型
@property (nonatomic, copy) NSString *access_token;  //!< 用户标识
@property (nonatomic, assign) NSTimeInterval expires_in;  //!< 时间
@property (nonatomic, copy) NSString *refresh_token;  //!< 刷新用户标识


-(BOOL)isUserLogin;

+(instancetype)configUserModel:(NSDictionary *)dataDict token:(NSDictionary *)tokenDict;


@end







