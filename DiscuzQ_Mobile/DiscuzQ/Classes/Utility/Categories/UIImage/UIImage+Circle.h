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
+(UIImage *)dz_QRImageWithURLString:(NSString *)urlString;



/**
 生成毛玻璃效果图

 @param blurRadius 灰度
 @param tintColor
 @param saturationDeltaFactor
 @param maskImage 图片
 @return 毛玻璃图片
 */
- (UIImage *)dz_blurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

/**
 取图片中间部分

 @param image 图片
 @param size 获取尺寸
 @return 返回图片
 */
+ (UIImage *)cutCenterImage:(UIImage *)image size:(CGSize)size;

/**
 裁剪图片中心区域 宽高 2:1

 @param image 裁剪的图片
 @return 返回裁剪后的图片
 */
+ (UIImage *)cutCenterImage:(UIImage *)image width:(CGFloat)width;


/**
 生成指定背景色的圆角可拉伸图片
 */
+ (UIImage *)dz_imageWithSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;


/**
 生成圆角裁剪后的图片
 */
- (UIImage *)dz_clipImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius;


@end
