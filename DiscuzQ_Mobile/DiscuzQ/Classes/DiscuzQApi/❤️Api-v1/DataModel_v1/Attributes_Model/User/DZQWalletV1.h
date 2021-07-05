//
//  DZQWalletV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZOtherRelationV1.h"

// 需要继承自 DZQSuperAttribute

@interface DZQWalletV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;  //!< 所属用户 ID
@property (nonatomic, assign) float available_amount;  //!< 用户钱包可用金额
@property (nonatomic, assign) float freeze_amount;  //!< 用户钱包冻结金额，交易过程中冻结的资金
@property (nonatomic, assign) NSInteger wallet_status;  //!< 钱包状态，0：表示正常；1：冻结提现，此状态下，用户无法申请提现。
@property (nonatomic, assign) float cash_tax_ratio;  //!< 用户提现时的税率

@end


@interface DZQDataWallet : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQWalletV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQWalletRelationV1 *relationships;  //!< 属性注释

@end

