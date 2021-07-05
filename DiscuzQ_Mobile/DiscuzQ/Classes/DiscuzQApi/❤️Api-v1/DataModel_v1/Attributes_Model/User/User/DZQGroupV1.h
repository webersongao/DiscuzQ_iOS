//
//  DZQGroupV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQGroupRelationV1.h"

@interface DZQGroupV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *name;  //!< 属性注释
@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 颜色
@property (nonatomic, copy) NSString *icon;  //!< 用户组图标
@property (nonatomic, assign) BOOL isDefault;  //!< 是否为默认用户组

@property (nonatomic, assign) BOOL isDisplay;  //!< 是否显示在用户名后
@property (nonatomic, assign) BOOL isPaid;  //!< 是否收费：0 不收费，1 收费

@property (nonatomic, assign) float fee;  //!< 收费金额
@property (nonatomic, assign) NSInteger days;  //!< 付费获得天数
@property (nonatomic, assign) NSInteger scale;  //!< 属性注释
@property (nonatomic, assign) BOOL is_subordinate;  //!< 属性注释
@property (nonatomic, assign) BOOL is_commission;  //!< 属性注释
@property (nonatomic, assign) NSInteger checked;  //!< 属性注释

@end



@interface DZQDataGroup : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQGroupV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQGroupRelationV1 *relationships;    //!< 属性注释

@end

