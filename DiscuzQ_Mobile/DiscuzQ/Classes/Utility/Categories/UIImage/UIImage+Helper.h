//
//  UIImage+Helper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Helper)

/// 根据URL 生成二维码 图像
+(UIImage *)dz_QRImageWithURLString:(NSString *)urlString;


/// 生成二维码 (彩色)
/// @param string 需要生成二维码的字符串
+ (UIImage *)dz_QRColorfulImageWithURLStringss:(NSString *)string;




@end

NS_ASSUME_NONNULL_END
