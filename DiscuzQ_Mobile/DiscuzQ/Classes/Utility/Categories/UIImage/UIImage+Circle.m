//
//  UIImage+Circle.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/8/22.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "UIImage+Circle.h"
#import <objc/message.h>

@implementation UIImage (Circle)
+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}
/** 设置圆形图片*/
- (UIImage *)cutCircleImage {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    // 设置圆形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    // 裁剪
    CGContextClip(ctr);
    // 将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)load {
#ifdef DEBUG
    Method imageMethod = class_getClassMethod([self class], @selector(imageNamed:));
    Method dz_ImgMethod = class_getClassMethod([self class], @selector(dz_imageName:));
    method_exchangeImplementations(imageMethod, dz_ImgMethod);
#endif
}

+ (UIImage *)dz_imageName:(NSString *)imageName {
    UIImage *image = [UIImage dz_imageName:imageName];
    if (image == nil) {
        NSLog(@"%@图片不存在",imageName);
    }
    return image;
}

+ (UIImage *)imageTintColorWithName:(NSString *)imageName superView:(UIView *)superView {
    if (superView == nil) {
        KSLog(@"superView不能为nil");
        return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    superView.tintColor = K_Color_Theme;
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

/**
 颜色转图片
 
 @param color 颜色
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color {
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    return [UIImage createImageWithColor:color andRect:rect];
}

/**
 颜色转图片
 
 @param color 颜色
 @param height 绘制的高度
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color andHeight:(CGFloat)height {
    
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,height);
    return [UIImage createImageWithColor:color andRect:rect];
}

/**
 颜色转图片
 
 @param color 颜色
 @param rect 绘制的位置大小
 @return 图片
 */
+ (UIImage*)createImageWithColor:(UIColor *)color andRect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


/// 根据URL 生成二维码 图像
+(UIImage *)QRImageWithURLString:(NSString *)urlString{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    return [UIImage imageWithCIImage:[filter outputImage]];
}

@end
