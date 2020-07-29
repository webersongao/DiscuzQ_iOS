//
//  DZOtherRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@class DZQDataCash,DZQDataWallet,DZQDataOrder;

@interface DZQLoginRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataLoginUser *users;  //!< 属性注释

@end


@interface DZQWalletRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 属性注释

@end


@interface DZQCashRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataCash *userWallet;  //!< 属性注释

@end


