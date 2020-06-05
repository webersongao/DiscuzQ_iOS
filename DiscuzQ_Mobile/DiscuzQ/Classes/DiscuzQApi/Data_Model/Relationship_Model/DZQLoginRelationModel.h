//
//  DZQLoginRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQLoginRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataLoginUser *users;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
