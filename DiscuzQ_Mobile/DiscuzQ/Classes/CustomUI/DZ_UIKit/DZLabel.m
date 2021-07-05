//
//  DZLabel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZLabel.h"

@implementation DZLabel

+ (DZLabel *)dz_labelWithSize:(CGSize)size  Title:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)color
{
    //限免图标 整本书限免的情况
    DZLabel *label = [[DZLabel alloc] initWithFrame:CGRectZero];
    label.text = title;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:10];
    label.backgroundColor = [UIColor clearColor];
    if (size.width == 0) {
        [label sizeToFit];
    } else {
        label.size = [label boundingRectWithSize:size];
    }
    
    return label;
}

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize
{
    DZLabel *label = [[DZLabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment
{
    DZLabel *label = [[DZLabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = textAlignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

+ (DZLabel *)dz_labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    DZLabel *label = [[DZLabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = textAlignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

@end
