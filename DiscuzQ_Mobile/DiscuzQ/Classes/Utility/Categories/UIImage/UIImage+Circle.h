//
//  UIImage+Circle.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/8/22.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Circle)
- (UIImage *)cutCircleImage;
+ (UIImage *)resizeImage:(NSString *)imageName;
+ (__kindof UIImage *)dz_imageName:(NSString *)imageName;

+ (UIImage *)imageTintColorWithName:(NSString *)imageName superView:(UIView *)superView;

/**
 颜色转图片
 
 @param color 颜色
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;

/**
 颜色转图片
 
 @param color 颜色
 @param height 绘制的高度
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 颜色转图片
 
 @param color 颜色
 @param rect 绘制的位置大小
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor *)color andRect:(CGRect)rect;


/// 根据URL 生成二维码 图像
+(UIImage *)QRImageWithURLString:(NSString *)urlString;



@end
