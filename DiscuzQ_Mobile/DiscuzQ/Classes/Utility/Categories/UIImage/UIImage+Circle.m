//
//  UIImage+Circle.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/8/22.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "UIImage+Circle.h"
#import <objc/message.h>
#import <Accelerate/Accelerate.h>

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
    superView.tintColor = KGreen_Color;
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
+(UIImage *)dz_QRImageWithURLString:(NSString *)urlString{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    return [UIImage imageWithCIImage:[filter outputImage]];
}



/// 生成毛玻璃效果图
- (UIImage *)dz_blurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage {
    // Check pre-conditions.
    if (self.size.width < 1 || self.size.height < 1) {
        NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", self.size.width, self.size.height, self);
        return nil;
    }
    if (!self.CGImage) {
        NSLog (@"*** error: image must be backed by a CGImage: %@", self);
        return nil;
    }
    if (maskImage && !maskImage.CGImage) {
        NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
        return nil;
    }
    
    CGRect imageRect = { CGPointZero, self.size };
    UIImage *effectImage = self;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            // A description of how to compute the box kernel width from the Gaussian
            // radius (aka standard deviation) appears in the SVG spec:
            // http://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement
            //
            // For larger values of 's' (s >= 2.0), an approximation can be used: Three
            // successive box-blurs build a piece-wise quadratic convolution kernel, which
            // approximates the Gaussian kernel to within roughly 3%.
            //
            // let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)
            //
            // ... if d is odd, use three box-blurs of size 'd', centered on the output pixel.
            //
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, imageRect, self.CGImage);
    
    // Draw effect image.
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // Add in color tint.
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

#pragma mark 根据size截取图片中间矩形区域的图片 这里的size是正方形
/// 裁剪图片中心区域
+ (UIImage *)cutCenterImage:(UIImage *)image size:(CGSize)size {

    CGSize imageSize = image.size;
    CGRect rect;

    //根据图片的大小计算出图片中间矩形区域的位置与大小
    if (imageSize.width > imageSize.height) {
        float leftMargin = (imageSize.width - imageSize.height) * 0.5;
        rect = CGRectMake(leftMargin, 0, imageSize.height, imageSize.height);
    }else{
        float topMargin = (imageSize.height - imageSize.width) * 0.5;
        rect = CGRectMake(0, topMargin, imageSize.width, imageSize.width);
    }
    
    rect.size.width = rect.size.height * 0.5;
    
    CGImageRef imageRef = image.CGImage;
    //截取中间区域矩形图片
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *tmp = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    
    UIGraphicsBeginImageContext(size);
    CGRect rectDraw = CGRectMake(0, 0, size.width, size.height);
    [tmp drawInRect:rectDraw];
    // 从当前context中创建一个改变大小后的图片
    tmp = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return tmp;
}
/// 获取图片中心区域  宽高 2:1
+ (UIImage *)cutCenterImage:(UIImage *)image width:(CGFloat)width {
    
    /// 1. 计算图片裁剪区域
    CGRect rect;
    if (image.size.width * 0.5 > image.size.height) {
        CGFloat height = image.size.height;
        CGFloat width = height * 2;
        CGFloat x = (image.size.width - width) * 0.5;
        rect = CGRectMake(x, 0, width, height);
    } else {
        CGFloat width = image.size.width;
        CGFloat height = width * 0.5;
        CGFloat y = (image.size.height - height) * 0.5;
        rect = CGRectMake(0, y, width, height);
    }
    
    /// 2. 获取裁剪后的图片
    CGImageRef    imageRef     = image.CGImage;
    CGImageRef    imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage        *tmp         = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);

    return tmp;
}

+ (UIImage *)dz_imageWithSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointZero, size} cornerRadius:cornerRadius];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius) resizingMode:UIImageResizingModeStretch];
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)dz_clipImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGRect circleRect = (CGRect){CGPointZero, size};
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:cornerRadius];
    
    [circlePath addClip];
    
    [self drawInRect:circleRect];
    
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return roundedImage;
}


@end
