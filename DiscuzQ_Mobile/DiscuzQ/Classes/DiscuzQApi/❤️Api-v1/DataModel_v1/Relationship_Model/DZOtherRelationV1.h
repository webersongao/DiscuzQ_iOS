//
//  DZOtherRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@class DZQDataCash,DZQDataWallet,DZQDataOrder;

@interface DZQLoginRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataLoginUser *users;  //!< 属性注释

@end


@interface DZQWalletRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 属性注释

@end


@interface DZQCashRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataCash *userWallet;  //!< 属性注释

@end


