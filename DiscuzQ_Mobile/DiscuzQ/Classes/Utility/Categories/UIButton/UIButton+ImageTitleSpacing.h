//
//  UIButton+ImageTitleSpacing.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/8/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsImageTop, // image在上，label在下
    MKButtonEdgeInsetsImageLeft, // image在左，label在右
    MKButtonEdgeInsetsImageBottom, // image在下，label在上
    MKButtonEdgeInsetsImageRight // image在右，label在左
};

@interface UIButton (ImageTitleSpacing)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


/**
 设置图片和文字分离的按钮

 @param frame <#frame description#>
 @param titleStr <#titleStr description#>
 @param titleColor <#titleColor description#>
 @param fontSize <#fontSize description#>
 @param normalPath <#normalPath description#>
 @param HighlightedIconPath <#HighlightedIconPath description#>
 @param style <#style description#>
 @param space <#space description#>
 @return <#return value description#>
 */
+ (UIButton *)spacingButtonWithFrame:(CGRect)frame title:(NSString *)titleStr titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize normalIconPath:(NSString *)normalPath HighlightedIconPath:(NSString*)HighlightedIconPath InsetsStyle:(MKButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;







@end








