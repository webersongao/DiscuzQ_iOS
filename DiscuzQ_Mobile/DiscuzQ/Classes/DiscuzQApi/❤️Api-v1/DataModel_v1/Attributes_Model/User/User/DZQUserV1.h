//
//  DZQUserV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseUserV1.h"
#import "DZQSuperModel.h"
#import "DZQGroupV1.h"

@interface DZQUnReadV1 : NSObject

@property (nonatomic, assign) NSInteger liked;  //!< 点赞我的
@property (nonatomic, assign) NSInteger system;  //!< 系统通知
@property (nonatomic, assign) NSInteger replied;  //!< 回复我的
@property (nonatomic, assign) NSInteger related;  //!< @我的
@property (nonatomic, assign) NSInteger rewarded;  //!< 打赏我的
@property (nonatomic, assign) NSInteger questioned;  //!< 问答通知
@property (nonatomic, assign) NSInteger withdrawal;  //!< 提现通知

@end;

// 登录用户的详细信息
@interface DZQUserV1 : DZQBaseUserV1

@property (nonatomic, copy) NSString *originalMobile;  //!< 属性注释
@property (nonatomic, copy) NSString *registerIp;  //!< 属性注释
@property (nonatomic, copy) NSString *registerPort;  //!< 属性注释
@property (nonatomic, copy) NSString *lastLoginIp;  //!< 属性注释
@property (nonatomic, copy) NSString *lastLoginPort;  //!< 属性注释

@property (nonatomic, copy) NSString *identity;  //!< 注册理由
@property (nonatomic, copy) NSString *realname;  //!< 属性注释
@property (nonatomic, copy) NSString *mobile;  //!< 属性注释
@property (nonatomic, assign) BOOL hasPassword;  //!< 属性注释
@property (nonatomic, assign) BOOL canWalletPay;  //!< 属性注释
@property (nonatomic, assign) double walletBalance;  //!< 属性注释
@property (nonatomic, assign) double walletFreeze;  //!< 用户冻结余额

@property (nonatomic, assign) BOOL paid;  //!< 属性注释
@property (nonatomic, copy) NSString *payTime;  //!< 属性注释

@property (nonatomic, assign) NSInteger unreadNotifications;  //!< 属性注释
@property (nonatomic, strong) DZQUnReadV1 *typeUnreadNotifications;  //!< 属性注释

@end


@interface DZQDataLoginUser : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQUserV1 *attributes;    //!< 属性注释

@end

