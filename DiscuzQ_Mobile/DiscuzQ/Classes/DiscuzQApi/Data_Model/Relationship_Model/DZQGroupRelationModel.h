//
//  DZQGroupRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQPermissionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQGroupRelationModel : DZQSuperRelation


@property (nonatomic, strong) DZQPermissionModel *permission;  //!< 分组权限

@end

NS_ASSUME_NONNULL_END
