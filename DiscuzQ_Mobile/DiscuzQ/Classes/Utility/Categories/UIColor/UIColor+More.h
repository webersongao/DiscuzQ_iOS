//
//  UIColor+More.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/3/1.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (More)

+(UIColor*)mainColor:(UIImage*)image;

+ (UIColor *)colorWithString:(NSString *)colorstr;

+ (UIColor *)color16WithHexString:(NSString *)color;

+(UIColor *)imagePaletteColorString:(NSDictionary *)allModeColorDic;

+ (UIColor *)color16WithHexString:(NSString *)color alpha:(float)ap;


@end


