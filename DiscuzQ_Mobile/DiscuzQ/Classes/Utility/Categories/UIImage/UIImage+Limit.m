//
//  UIImage+Limit.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/7/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UIImage+Limit.h"

@implementation UIImage (Limit)

- (NSData *)dz_limitImageSize {
    UIImage *image = self;
    float imageViewWidth = 1040.0;
    float imageViewHeight = 720.0;
    UIImage * thumbImage;
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    CGFloat M = 1  * 1000 * 1000;
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    NSData *data;
    if ([imageData length] < M) {
        thumbImage = image;
    } else {
        thumbImage = [image dz_transformWithLockedRatio:imageViewWidth
                                                height:imageViewHeight
                                                rotate:YES];
    }
    if (UIImagePNGRepresentation(thumbImage) == nil) {
        data = UIImageJPEGRepresentation(thumbImage, 0.8);
    } else {
        data = UIImagePNGRepresentation(thumbImage);
    }
    
    while ([data length] > M && compression > maxCompression) {
        compression -= 0.1;
        data = UIImageJPEGRepresentation(thumbImage, compression);
    }
    
    return data;
}

- (UIImage *)dz_imageWithAlpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage*)dz_transformWithLockedRatio:(CGFloat)width
                              height:(CGFloat)height rotate:(BOOL)rotate
{
    UIImage *image = self;
    float sourceWidth = image.size.width;
    float sourceHeight = image.size.height;
    
    float widthRatio = width / sourceWidth;  // 与期望的宽度比例 如期望100 / 实际50  = 2
    float heightRatio = height / sourceHeight; // 与期望的高度比例 如期望200 / 实际400 = 0.5
    
    
    if (widthRatio <= 1 && heightRatio <= 0) {
        return image;
    }
    
    
    float destWidth, destHeight;
    if (widthRatio > heightRatio) { // 选取真正是缩小比例的方法
        destWidth = sourceWidth * heightRatio; // 为了保证原图的比例调整，之前的比例不对，期望高度改为 100 * 0.5 = 50
        destHeight = height; // 期望高度还是 200
    } else {
        destWidth = width;
        destHeight = sourceHeight * widthRatio;
    }
    
    return [image dz_transform:destWidth height:destHeight rotate:rotate];
}

- (UIImage*)dz_transform:(CGFloat)width
               height:(CGFloat)height rotate:(BOOL)rotate
{
    UIImage *image = self;
    CGFloat destW = roundf(width);
    CGFloat destH = roundf(height);
    CGFloat sourceW = roundf(width);
    CGFloat sourceH = roundf(height);
    
    if (rotate) {
        if (image.imageOrientation == UIImageOrientationRight
            || image.imageOrientation == UIImageOrientationLeft) {
            sourceW = height;
            sourceH = width;
        }
    }
    
    CGImageRef imageRef = image.CGImage;  // 转化为位图
    
    int bytesPerRow = destW * (CGImageGetBitsPerPixel(imageRef) >> 3); // 每行像素点大小(CGImageGetBitsPerPixel(imageRef) >> 3) = CGImageGetBitsPerPixel(imageRef) / 8
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                bytesPerRow,
                                                CGImageGetColorSpace(imageRef),
                                                CGImageGetBitmapInfo(imageRef));
    
    if (rotate) {
        if (image.imageOrientation == UIImageOrientationDown) {
            CGContextTranslateCTM(bitmap, sourceW, sourceH);
            CGContextRotateCTM(bitmap, 180 * (M_PI/180));
            
        } else if (image.imageOrientation == UIImageOrientationLeft) {
            CGContextTranslateCTM(bitmap, sourceH, 0);
            CGContextRotateCTM(bitmap, 90 * (M_PI/180));
            
        } else if (image.imageOrientation == UIImageOrientationRight) {
            CGContextTranslateCTM(bitmap, 0, sourceW);
            CGContextRotateCTM(bitmap, -90 * (M_PI/180));
        }
    }
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}

@end


