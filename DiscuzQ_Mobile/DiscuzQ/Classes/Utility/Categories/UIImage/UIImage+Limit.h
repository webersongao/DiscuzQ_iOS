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
- (NSData *)limitImageSize;

// 锁定比例缩放
+ (UIImage*)transformWithLockedRatioWidth:(CGFloat)width
                              height:(CGFloat)height rotate:(BOOL)rotate;

// 缩放
+ (UIImage*)transform:(UIImage *)image width:(CGFloat)width
               height:(CGFloat)height rotate:(BOOL)rotate;
@end


