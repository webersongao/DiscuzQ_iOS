//
//  UIView+Extension.h
//  Travel
//
//  Created by WebersonGao on 17/10/29.
//  Copyright © 2015年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/** 判断self和anotherView是否重叠 */
- (BOOL)dz_intersectsWithAnotherView:(UIView *)anotherView;

- (UIViewController *)dz_GetViewController;

- (UIView *)snapshotCellView;

/// 获取截图
/// @param view 需要截图的视图
+ (UIImage *)getScreenshotImage:(UIView *)view;

@end
