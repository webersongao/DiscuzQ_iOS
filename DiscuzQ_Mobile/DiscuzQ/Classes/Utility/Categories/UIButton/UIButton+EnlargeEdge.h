//
//  UIButton+EnlargeEdge.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/4/4.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EnlargeEdge)

/** 设置可点击范围到按钮边缘的距离 */
- (void)setEnlargeEdge:(CGFloat)size;

/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;


@end
NS_ASSUME_NONNULL_END
