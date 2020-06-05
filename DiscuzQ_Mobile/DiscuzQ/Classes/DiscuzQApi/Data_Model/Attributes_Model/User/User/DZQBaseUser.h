//
//  DZQBaseUser.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQBaseUser : DZQSuperAttribute

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

@property (nonatomic, copy) NSString *banReason;  //!< 属性注释
@property (nonatomic, copy) NSString *registerReason;  //!< 属性注释

@end


@interface DZQDataUser : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQBaseUser *attributes;    //!< 属性注释

@end
