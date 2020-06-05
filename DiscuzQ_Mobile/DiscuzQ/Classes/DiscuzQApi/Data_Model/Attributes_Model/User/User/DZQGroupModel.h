//
//  DZQGroupModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"


@interface DZQGroupModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *name;  //!< 属性注释
@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 属性注释
@property (nonatomic, copy) NSString *icon;  //!< 属性注释
@property (nonatomic, assign) BOOL isDefault;  //!< 属性注释

@end



@interface DZQDataGroup : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQGroupModel *attributes;    //!< 属性注释

@end

