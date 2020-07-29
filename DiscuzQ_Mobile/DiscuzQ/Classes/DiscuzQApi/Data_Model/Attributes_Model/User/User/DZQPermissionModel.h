//
//  DZQPermissionModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQPermissionModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *group_id;  //!< 属性注释
@property (nonatomic, copy) NSString *permission;  //!< 属性注释

@end

@interface DZQDataPermission : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQPermissionModel *attributes;    //!< 属性注释

@end



NS_ASSUME_NONNULL_END
