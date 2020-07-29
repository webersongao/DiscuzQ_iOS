//
//  DZQGroupModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQGroupRelationModel.h"

@interface DZQGroupModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *name;  //!< 属性注释
@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 颜色
@property (nonatomic, copy) NSString *icon;  //!< 用户组图标
@property (nonatomic, assign) BOOL isDefault;  //!< 是否为默认用户组

@property (nonatomic, assign) BOOL isDisplay;  //!< 是否显示在用户名后
@property (nonatomic, assign) BOOL isPaid;  //!< 是否收费：0 不收费，1 收费

@property (nonatomic, assign) float fee;  //!< 收费金额
@property (nonatomic, assign) NSInteger days;  //!< 付费获得天数


@end



@interface DZQDataGroup : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQGroupModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQGroupRelationModel *relationships;    //!< 属性注释

@end

