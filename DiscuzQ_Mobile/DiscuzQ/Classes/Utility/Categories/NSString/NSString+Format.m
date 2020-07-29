//
//  NSString+Format.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "NSString+Format.h"
#import "YYAnimatedImageView.h"

@implementation NSString (Format)

+(NSAttributedString *)changeFormatterToAttributeWithString:(NSString *)chagneString{
    if (chagneString == nil) {
        chagneString = @"";
    }
    return [[NSAttributedString alloc] initWithString: chagneString];
}

+(NSAttributedString *)changeFormatterToAttributeWithString:(NSString *)chagneString normalFont:(UIFont *)normalFont textColor:(UIColor *)textColor{
    
    if (chagneString == nil) {
        chagneString = @"";
    }
    
    NSDictionary *dic = @{NSFontAttributeName:normalFont, NSForegroundColorAttributeName:textColor};
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:checkNull(chagneString) attributes:dic];
    return attributeString;
}

+ (NSMutableAttributedString *)attributeString:(NSString *)string Color:(UIColor *)foreColor
                                    normalFont:(UIFont *)normalFont
                                         range:(NSRange)range
                                    highleFont:(UIFont*)highleFont
                                     lineSpace:(CGFloat)lineSpace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    NSDictionary *dic = @{NSFontAttributeName:normalFont, NSParagraphStyleAttributeName:paraStyle};
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:checkNull(string) attributes:dic];
    
    [attributeString addAttribute:NSFontAttributeName
                            value:highleFont
                            range:range];
    
    [attributeString addAttribute:NSForegroundColorAttributeName
                            value:foreColor
                            range:range];
    
    return attributeString;
}

// 生成 左图片右文字的 string
+(NSMutableAttributedString *)attributedWithLeftimage:(NSString *)imageName RightTittle:(NSString *)title textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize;
{
    NSMutableAttributedString *attributeString;
    
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    //图片
    imageName = checkNull(imageName);
    UIImage *attachImage = imageName.length ? [UIImage imageNamed:imageName] : nil;
    textAttachment.image = attachImage;
    float imageWidth = FontSize*(attachImage.size.width)/(attachImage.size.height);
    textAttachment.bounds = CGRectMake(0, -2, imageWidth, FontSize);
    
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:attachmentString];
    [attributeString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    
    // 文字
    NSString *allString = [NSString stringWithFormat:@"%@",title];
    NSMutableAttributedString *rightAttributeString = [[NSMutableAttributedString alloc] initWithString:allString];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    //    paraStyle.alignment = NSTextAlignmentLeft;
    //    paraStyle.lineSpacing = lineSpacing;//行距
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    [rightAttributeString addAttributes:dic range:NSMakeRange(0, allString.length)];
    
    [attributeString appendAttributedString:[[NSAttributedString alloc] initWithAttributedString:rightAttributeString]];
    
    return attributeString;
}

/// 生成 左文字 右图片 的 string
+(NSMutableAttributedString *)attributedWithLeftTittle:(NSString *)title rightimage:(NSString *)imageName textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize
{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    //图片
    UIImage *attachImage = [UIImage imageNamed:imageName];
    textAttachment.image = attachImage;
    float imageWidth = FontSize*(attachImage.size.width)/(attachImage.size.height);
    textAttachment.bounds = CGRectMake(0, -2, imageWidth, FontSize);
    
    NSAttributedString *imegAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    // 文字
    NSString *allString = [NSString stringWithFormat:@"%@",title];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:allString];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    //    paraStyle.alignment = NSTextAlignmentLeft;
    //    paraStyle.lineSpacing = lineSpacing;//行距
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    [attributeString addAttributes:dic range:NSMakeRange(0, allString.length)];
    
    
    [attributeString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    [attributeString appendAttributedString:[[NSAttributedString alloc] initWithAttributedString:imegAttachmentString]];
    
    return attributeString;
}

/// 生成 左文字 右图片 的 string  适用于赋值给YYLabel
+(NSMutableAttributedString *)dzyy_attributedWithLeftTittle:(NSString *)title rightimage:(NSString *)imageName textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize{
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ",title]];
    NSDictionary *dic = @{NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    [attr addAttributes:dic range:NSMakeRange(0, attr.string.length)];
    
    YYAnimatedImageView *imgView2 = [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imgView2.frame = CGRectMake(0, 0, FontSize, FontSize);
    
    NSMutableAttributedString *attchText2 = [NSMutableAttributedString yy_attachmentStringWithContent:imgView2 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imgView2.frame.size alignToFont:[UIFont systemFontOfSize:FontSize] alignment:YYTextVerticalAlignmentCenter];
    
    [attr appendAttributedString:attchText2];
    
    return attr;
}

//生成有多个图片插入制定位置的string
+(NSMutableAttributedString *)attributedWithTittle:(NSString *)title rightimage:(NSArray *)imageNames textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize hightedText:(NSString *)hightedText hightedColor:(UIColor *)hightedColor{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    //    paraStyle.alignment = NSTextAlignmentLeft;
    //    paraStyle.lineSpacing = lineSpacing;//行距
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    [attributeString addAttributes:dic range:NSMakeRange(0, attributeString.length)];
    
    for (int index = 0; index<imageNames.count; index++) {
        attributeString = [self insertSepratorImage:attributeString];
        NSString *imageName = imageNames[index];
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        UIImage *attachImage = [UIImage imageNamed:imageName];
        attach.image = attachImage;
        float imageWidth = FontSize*(attachImage.size.width)/(attachImage.size.height);
        attach.bounds = CGRectMake(0, -2, imageWidth, FontSize);
        if (index > 0) {
            attach.bounds = CGRectMake(-1, -2, imageWidth, FontSize);
        }
        NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
        //将图片插入到合适的位置
        [attributeString insertAttributedString:attachString atIndex:attributeString.length];
        if (index != imageNames.count-1) {
            attributeString = [self insertSepratorImage:attributeString];
        }
    }
    
    NSArray *rangeArray = [self rangesOfString:title referString:hightedText];
    for (NSValue *value in rangeArray) {
        NSRange range = [value rangeValue];
        NSDictionary *hightedDic = @{NSParagraphStyleAttributeName:paraStyle,
                                     NSForegroundColorAttributeName:hightedColor,
                                     NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
        [attributeString addAttributes:hightedDic range:range];
    }
    return attributeString;
    
}


+(NSMutableAttributedString *)insertSepratorImage:(NSMutableAttributedString *)attributeString{
    UIImage *sepratorImage = [UIImage imageNamed:@"sepratorImage"];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = sepratorImage;
    attach.bounds = CGRectMake(0, 0, 2, 3);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    [attributeString insertAttributedString:attachString atIndex:attributeString.length];
    return attributeString;
}

+ (NSArray <NSValue *> *)rangesOfString:(NSString *)string referString:(NSString *)subStr {
    if (subStr == nil && [subStr isEqualToString:@""]) {
        return nil;
    }
    
    int count = string.length - subStr.length+1;
    if (count < 0) {
        count = 0;
        return nil;
    }
    
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString *temp;
    
    for (int i = 0; i < count; i ++) {
        temp = [string substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:[NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}

/**
 换行 间距富文本
 @param lineSpacing 行间距
 */
+(NSMutableAttributedString *)attributeWithLineSpaceing:(int)lineSpacing text:(NSString *)textString font:(UIFont *)font{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:checkNull(textString)];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    if (textString.length < 30) {
        //默认文字小于30的 没有行间距， 如果有其他需求，请单独写方法
        paraStyle.lineSpacing = 0;
    }else{
        paraStyle.lineSpacing = lineSpacing;//行距
    }
    
    paraStyle.hyphenationFactor = 0.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,
                          NSFontAttributeName:font
    };
    [text addAttributes:dic range:NSMakeRange(0, textString.length)];
    return text;
}

/**
 换行 间距富文本
 @param lineSpacing 行间距
 带 宽度
 */
+(NSMutableAttributedString *)attributeWithLineSpaceing:(int)lineSpacing text:(NSString *)textString viewWidth:(float)viewWidth font:(UIFont *)font{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:checkNull(textString)];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行距
    paraStyle.hyphenationFactor = 0.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,
                          NSFontAttributeName:font
    };
    //    NSKernAttributeName:@0.5f
    [text addAttributes:dic range:NSMakeRange(0, textString.length)];
    
    
    // 计算一行文本的高度
    CGFloat oneHeight = [@"一行text" boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
    CGFloat rowHeight = [textString boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
    CGFloat offset = -(1.0/3 * lineSpacing) - 1.0/3;
    offset = rowHeight >= oneHeight ?  0 : offset;
    NSRange range = NSMakeRange(0, [text length]);
    [text addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];
    return text;
}


/**
 富文本
 
 @param textString 前半段文字
 @param textColor 前半段文字颜色
 @param FontSize 前半段文字大小
 @param lineSpacing 行间距
 */
+(NSMutableAttributedString *)attributeTextWithString:(NSString *)textString textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize LineSpaceing:(int)lineSpacing{
    
    NSString *allString = [NSString stringWithFormat:@"%@",textString];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:allString];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行距
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    //    NSKernAttributeName:@0.5f
    [text addAttributes:dic range:NSMakeRange(0, textString.length)];
    
    return text;
}

/**
 富文本
 
 @param frontString 前半段文字
 @param textColor 前半段文字颜色
 @param FontSize 前半段字体大小
 
 @param endString 后半段文字
 @param endtextColor 后半段文字颜色
 @param endFontSize 后半段字号
 @param lineSpacing 行间距
 */
+(NSMutableAttributedString *)attributeTextWithFrontString:(NSString *)frontString textColor:(UIColor*)textColor Font:(UIFont *)Font endString:(NSString *)endString endtextColor:(UIColor*)endtextColor endFont:(UIFont *)endFont LineSpaceing:(int)lineSpacing{
    
    frontString = checkNull(frontString);
    endString = checkNull(endString);
    
    NSString *allString = [NSString stringWithFormat:@"%@ %@",frontString,endString];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:allString];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行距
    
    UIFont *frontFont = Font ? Font : [UIFont systemFontOfSize:16];
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:frontFont};
    [text addAttributes:dic range:NSMakeRange(0, frontString.length)];
    
    UIFont *endFonts = endFont ? endFont : [UIFont systemFontOfSize:12];
    NSDictionary *endDic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:endtextColor,NSFontAttributeName:endFonts};
    
    [text addAttributes:endDic range:NSMakeRange(frontString.length +1, endString.length)];
    
    return text;
}

/**
 局部可点击的富文本
 
 @param lineSpacing 文字间距
 @param tapString 可点击的文字
 @param tapTextColor 点击文字颜色
 @param tapActionBlock 点击的block事件
 */
+(NSMutableAttributedString *)attributeTextWithNormalString:(NSString *)normalString normalColor:(UIColor*)normalColor normalSize:(CGFloat)normalSize LineSpaceing:(int)lineSpacing tapString:(NSString *)tapString tapTextColor:(UIColor*)tapTextColor tapActionBlock:(void(^)(void))tapActionBlock{
    
    tapString = checkNull(tapString);
    normalString = checkNull(normalString);
    NSString *allString = [NSString stringWithFormat:@"%@ %@",normalString,tapString];
    NSMutableAttributedString *attributedText  = [[NSMutableAttributedString alloc] initWithString:allString];
    
    attributedText.yy_color = normalColor;
    attributedText.yy_lineSpacing = lineSpacing;
    attributedText.yy_font = [UIFont systemFontOfSize:normalSize];
    if (tapString.length) {
        [attributedText yy_setTextHighlightRange:NSMakeRange(normalString.length+1, tapString.length) color:tapTextColor backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            if (tapActionBlock) {
                tapActionBlock();
            }
        }];
    }
    
    return attributedText;
}

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
+(NSMutableAttributedString *)attributeDelLineWithString:(NSString *)textString textColor:(UIColor*)textColor FontSize:(CGFloat)FontSize LineSpaceing:(int)lineSpacing delString:(NSString *)delString delColor:(UIColor *)delColor delFontSize:(CGFloat)delFontSize{
    
    NSString *allString = [NSString stringWithFormat:@"%@ %@",checkNull(textString),checkNull(delString)];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:allString];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpacing;//行距
    //    paraStyle.hyphenationFactor = 0.0;
    //    paraStyle.firstLineHeadIndent = 0.0;
    //    paraStyle.paragraphSpacingBefore = 0.0;
    //    paraStyle.headIndent = 0;
    //    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName:textColor,NSFontAttributeName:[UIFont systemFontOfSize:FontSize]};
    //    NSKernAttributeName:@0.5f
    [text addAttributes:dic range:NSMakeRange(0, textString.length)];
    
    // 删除线
    NSDictionary *delDict = @{NSFontAttributeName:[UIFont systemFontOfSize:delFontSize],
                              NSForegroundColorAttributeName:delColor,
    };
    [text addAttributes:delDict range:NSMakeRange(textString.length + 1, delString.length)];
    
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle | YYTextLineStylePatternSolid];
    decoration.color = delColor;
    [text yy_setTextStrikethrough:decoration range:NSMakeRange(textString.length + 1, delString.length)];
    return text;
}


@end












