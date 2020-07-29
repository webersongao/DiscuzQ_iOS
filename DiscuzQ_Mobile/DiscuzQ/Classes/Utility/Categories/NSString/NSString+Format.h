//
//  NSString+Format.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)


+(NSAttributedString *)changeFormatterToAttributeWithString:(NSString *)chagneString;

+(NSAttributedString *)changeFormatterToAttributeWithString:(NSString *)chagneString normalFont:(UIFont *)normalFont textColor:(UIColor *)textColor;

+ (NSMutableAttributedString *)attributeString:(NSString *)string Color:(UIColor *)foreColor
                                    normalFont:(UIFont *)normalFont
                                         range:(NSRange)range
                                    highleFont:(UIFont*)highleFont
                                     lineSpace:(CGFloat)lineSpace;
/// 生成 左图片 右文字 的 string
+(NSMutableAttributedString *)attributedWithLeftimage:(NSString *)imageName RightTittle:(NSString *)title textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize;


/// 生成 左文字 右图片 的 string
+(NSMutableAttributedString *)attributedWithLeftTittle:(NSString *)title rightimage:(NSString *)imageName textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize;

/// 生成 左文字 右图片 的 string  适用于赋值给YYLabel
+(NSMutableAttributedString *)dzyy_attributedWithLeftTittle:(NSString *)title rightimage:(NSString *)imageName textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize;

//生成有多个图片插入制定位置的string
+(NSMutableAttributedString *)attributedWithTittle:(NSString *)title rightimage:(NSArray *)imageNames textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize hightedText:(NSString *)hightedText hightedColor:(UIColor *)hightedColor;



/**
 换行 间距富文本
 @param lineSpacing 行间距
 */
+(NSMutableAttributedString *)attributeWithLineSpaceing:(int)lineSpacing text:(NSString *)textString font:(UIFont *)font;

/**
 换行 间距富文本
 @param lineSpacing 行间距
 带 宽度
 */
+(NSMutableAttributedString *)attributeWithLineSpaceing:(int)lineSpacing text:(NSString *)textString viewWidth:(float)labelWidth font:(UIFont *)font;

/**
 富文本 彩色 字号可定
 */
+(NSMutableAttributedString *)attributeTextWithString:(NSString *)textString textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize LineSpaceing:(int)lineSpacing;


/**
 前 后 两半段 富文本
 
 @param frontString 前半段文字
 @param textColor 前半段文字颜色
 @param Font 前半段字体大小
 
 @param endString 后半段文字
 @param endtextColor 后半段文字颜色
 @param endFont 后半段字号
 @param lineSpacing 行间距
 */
+(NSMutableAttributedString *)attributeTextWithFrontString:(NSString *)frontString textColor:(UIColor*)textColor Font:(UIFont *)Font endString:(NSString *)endString endtextColor:(UIColor*)endtextColor endFont:(UIFont *)endFont LineSpaceing:(int)lineSpacing;


/**
 局部可点击的富文本
 
 @param normalString 正常显示的文字
 @param normalColor 正常的文字颜色
 @param normalSize 正常的文字字号
 @param lineSpacing 文字间距
 @param tapString 可点击的文字
 @param tapTextColor 点击文字颜色
 @param tapActionBlock 点击的block事件
 */
+(NSMutableAttributedString *)attributeTextWithNormalString:(NSString *)normalString normalColor:(UIColor*)normalColor normalSize:(CGFloat)normalSize LineSpaceing:(int)lineSpacing tapString:(NSString *)tapString tapTextColor:(UIColor*)tapTextColor tapActionBlock:(void(^)(void))tapActionBlock;

/**
 带有删除线的富文本
 
 @param textString 前半段文字
 @param textColor 前半段文字颜色
 @param FontSize 前半段文字大小
 @param lineSpacing 行间距
 @param delString 删除线文字
 @param delColor 删除线颜色
 @param delFontSize 删除线文字字号
 */
+(NSMutableAttributedString *)attributeDelLineWithString:(NSString *)textString textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize LineSpaceing:(int)lineSpacing delString:(NSString *)delString delColor:(UIColor *)delColor delFontSize:(CGFloat)delFontSize;


@end












