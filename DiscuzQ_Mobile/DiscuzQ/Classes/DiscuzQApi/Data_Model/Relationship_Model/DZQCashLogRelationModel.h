//
//  DZQCashLogRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQCashLogRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataLoginUser *user;  //!< 用户信息
@property (nonatomic, strong) DZQDataWallet *userWallet;  //!< 用户钱包信息
//@property (nonatomic, strong) DZQDataCash *userWalletCash;  //!< 提现记录信息
@property (nonatomic, strong) DZQDataOrder *order;  //!< 订单信息。

@end

NS_ASSUME_NONNULL_END
