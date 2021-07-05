//
//  DZFlexBaseToolBox.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZFlexBaseToolBox : UIView

@property (nonatomic, strong) UIScrollView *boxScroll;  //!< <#属性注释#>
@property (nonatomic, assign,getter=isSpread) BOOL spread;  //!< 是否是展开的

@end

NS_ASSUME_NONNULL_END
