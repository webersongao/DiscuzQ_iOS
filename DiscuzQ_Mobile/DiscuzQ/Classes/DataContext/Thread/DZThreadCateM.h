//
//  DZThreadCateM.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateM : DZRootModel

@property (nonatomic, copy) NSString *pid;  //!< 属性注释
@property (nonatomic, copy) NSString *name;  //!< 板块描述
@property (nonatomic, copy) NSString *icon;  //!< 板块描述
@property (nonatomic, copy) NSString *parentid;  //!< 属性注释
@property (nonatomic, copy) NSString *categorydesc;  //!< 板块描述

@property (nonatomic, assign) NSInteger sort;  //!< 属性注释
@property (nonatomic, assign) NSInteger property;  //!< 属性注释
@property (nonatomic, assign) NSInteger threadCount;  //!< 属性注释
@property (nonatomic, assign) BOOL canCreateThread;  //!< 属性注释
@property (nonatomic, strong) NSArray<NSString *> *childSearchIds;  //!< 属性注释

@property (nonatomic, strong) NSArray<DZThreadCateM *> *childCategorys;  //!< 属性注释



@end

NS_ASSUME_NONNULL_END
