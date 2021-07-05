//
//  UIImage+Helper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)


/// 根据URL 生成二维码 图像
+(UIImage *)dz_QRImageWithURLString:(NSString *)urlString{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    return [UIImage imageWithCIImage:[filter outputImage]];
}


/// 生成二维码 (彩色)
/// @param string 需要生成二维码的字符串
+ (UIImage *)dz_QRColorfulImageWithURLStringss:(NSString *)string {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *qrImageData = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:qrImageData forKey:@"inputMessage"];
    
    UIColor *onColor = [UIColor colorWithRed:46/255.0 green:74/255.0 blue:135/255.0 alpha:1];
    UIColor *offColor = [UIColor whiteColor];
    //上色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage",filter.outputImage,
                             @"inputColor0",[CIColor colorWithCGColor:onColor.CGColor],
                             @"inputColor1",[CIColor colorWithCGColor:offColor.CGColor],
                             nil];
    
    CIImage *outputImage = [colorFilter outputImage];
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(60, 60)];
    UIImage *output_image = [UIImage imageWithCIImage:outputImage];
    return output_image;
}




@end
