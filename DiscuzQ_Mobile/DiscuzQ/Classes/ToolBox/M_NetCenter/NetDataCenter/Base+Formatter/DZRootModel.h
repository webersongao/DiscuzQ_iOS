//
//  DZRootModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "EFSQLiteObject.h"

NS_ASSUME_NONNULL_BEGIN

@class DZRootModel;


@interface DZStyle : NSObject

/// 存放一些基本的布局 和 格式化数据参数
+(DZStyle *)inner_dataStyle:(DZRootModel *)dataModel;

@end

@interface DZRootModel : EFSQLiteObject

@property (nonatomic, strong,readonly) DZStyle *style;  //!< 属性注释

-(void)updateStyleWithClass:(Class)styleClass;


@end






NS_ASSUME_NONNULL_END
