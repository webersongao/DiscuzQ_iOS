//
//  DZLabel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYLabel.h>

@interface DZLabel : UILabel


+ (DZLabel *)dz_labelWithSize:(CGSize)size  Title:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)color;

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize;

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment;

@end


