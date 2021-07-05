//
//  DZQCateV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQCateV3 : DZQBodyV3

@property (nonatomic, copy) NSString *pid;  //!< 属性注释
@property (nonatomic, copy) NSString *name;  //!< 板块描述
@property (nonatomic, copy) NSString *icon;  //!< 板块描述
@property (nonatomic, copy) NSString *parentid;  //!< 属性注释
@property (nonatomic, copy) NSString *cate_description;  //!< 板块描述

@property (nonatomic, assign) NSInteger sort;  //!< 属性注释
@property (nonatomic, assign) NSInteger property;  //!< 属性注释
@property (nonatomic, assign) NSInteger threadCount;  //!< 属性注释
@property (nonatomic, assign) BOOL canCreateThread;  //!< 属性注释
@property (nonatomic, strong) NSArray *searchIds;  //!< 属性注释

@property (nonatomic, strong) NSArray<DZQCateV3 *> *children;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
