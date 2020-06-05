//
//  UILabel+Common.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

+ (UILabel *)craeteLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(float)fontSize;

+ (UILabel *)labelWithSize:(CGSize)size  Title:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)color;

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize;

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment;




- (CGSize)boundingRectWithSize:(CGSize)size;

- (void)textLeftTopAlign;

/// 通用计算 label 高度和设置 label 行间距方法

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

/**
 计算文字宽度 W
 */
+ (CGFloat)text:(NSString*)text widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height;

/**
 计算文字高度 H
 */
+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

+ (CGFloat)text:(NSString*)text heightWithFont:(UIFont *)font width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

/// 荐语计算 label 高度和设置 label 行间距方法 荐语中的NSAttributedString添加了图片 需要特殊处理

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing attachImage:(NSString *)attchImageName;

+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing attachImage:(NSString *)attchImageName;

@end



