//
//  UIImage+Limit.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImage (Limit)

// 限制大小为1M
- (NSData *)dz_limitImageSize;

/// 改变图片透明度
- (UIImage *)dz_imageWithAlpha:(CGFloat)alpha;

// 锁定比例缩放
- (UIImage*)dz_transformWithLockedRatio:(CGFloat)width height:(CGFloat)height rotate:(BOOL)rotate;

// 缩放
+ (UIImage*)dz_transform:(UIImage *)image width:(CGFloat)width
               height:(CGFloat)height rotate:(BOOL)rotate;
@end


