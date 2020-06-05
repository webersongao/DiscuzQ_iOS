//
//  DZQUserModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseUser.h"
#import "DZQSuperModel.h"
#import "DZQGroupModel.h"

@interface DZQUnReadModel : NSObject

@property (nonatomic, assign) NSInteger liked;  //!< 点赞我的
@property (nonatomic, assign) NSInteger system;  //!< 系统通知
@property (nonatomic, assign) NSInteger replied;  //!< 回复我的
@property (nonatomic, assign) NSInteger related;  //!< @我的
@property (nonatomic, assign) NSInteger rewarded;  //!< 打赏我的
@property (nonatomic, assign) NSInteger withdrawal;  //!< 提现通知

@end;

@interface DZQUserModel : DZQBaseUser

@property (nonatomic, copy) NSString *originalMobile;  //!< 属性注释
@property (nonatomic, copy) NSString *registerIp;  //!< 属性注释
@property (nonatomic, copy) NSString *lastLoginIp;  //!< 属性注释
@property (nonatomic, copy) NSString *identity;  //!< 属性注释
@property (nonatomic, copy) NSString *realname;  //!< 属性注释
@property (nonatomic, copy) NSString *mobile;  //!< 属性注释
@property (nonatomic, assign) BOOL hasPassword;  //!< 属性注释
@property (nonatomic, assign) BOOL canWalletPay;  //!< 属性注释
@property (nonatomic, assign) double walletBalance;  //!< 属性注释

@property (nonatomic, assign) BOOL paid;  //!< 属性注释
@property (nonatomic, copy) NSString *payTime;  //!< 属性注释

@property (nonatomic, assign) NSInteger unreadNotifications;  //!< 属性注释
@property (nonatomic, strong) DZQUnReadModel *typeUnreadNotifications;  //!< 属性注释


@end


@interface DZQDataLoginUser : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQUserModel *attributes;    //!< 属性注释

@end

