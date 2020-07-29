//
//  DZQOrderRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQOrderRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 用户
@property (nonatomic, strong) DZQDataUser *payee;  //!< 

@end

NS_ASSUME_NONNULL_END
