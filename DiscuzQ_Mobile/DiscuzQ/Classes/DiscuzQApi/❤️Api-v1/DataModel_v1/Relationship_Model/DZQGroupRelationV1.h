//
//  DZQGroupRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQPermissionV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQGroupRelationV1 : DZQSuperRelation


@property (nonatomic, strong) DZQPermissionV1 *permission;  //!< 分组权限

@end

NS_ASSUME_NONNULL_END
