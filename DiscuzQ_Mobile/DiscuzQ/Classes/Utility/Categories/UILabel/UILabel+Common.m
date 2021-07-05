//
//  UILabel+Common.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//


#import "UILabel+Common.h"

@implementation UILabel (Common)

+ (UILabel *)labelWithSize:(CGSize)size  Title:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)color
{
    //限免图标 整本书限免的情况
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
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

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = textAlignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.textColor = titleColor;
    label.text = title;
    label.textAlignment = textAlignment;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    
    return label;
}

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                      options:\
               NSStringDrawingTruncatesLastVisibleLine |
               NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading
                                   attributes:attribute
                                      context:nil].size;
    
    
    return retSize;
}

- (void)textLeftTopAlign
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize retSize = [self.text boundingRectWithSize:CGSizeMake(self.width, 999)
                                          options:\
                   NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                       attributes:attributes
                                          context:nil].size;
   
    
    CGRect dateFrame =CGRectMake(10, 10, self.width, retSize.height);
    self.frame = dateFrame;
}

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:checkNull(text)];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setAlignment:NSTextAlignmentJustified];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}


+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",text]];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    int textHeight = rect.size.height;
    if (textHeight < fontSize*2) {
        textHeight = fontSize;
    }
    return textHeight+1;
    
}

+ (CGFloat)text:(NSString*)text widthWithFontSize:(CGFloat)fontSize height:(CGFloat)height {
    CGFloat tempWidth = 0;
    NSString *textString = checkNull(text);
    if (!textString.length) {
        return 0;
    }
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MAXFLOAT, height)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.text = textString;
    [label sizeToFit];
    tempWidth = label.width;
    return tempWidth+1;
}


+ (CGFloat)text:(NSString*)text heightWithFont:(UIFont *)font width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing{
    //    CGFloat tempHeight = 0;
    //    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, MAXFLOAT)];
    //    label.font = font;
    //    label.numberOfLines = 0;
    //    [label setText:text lineSpacing:lineSpacing];
    //    [label sizeToFit];
    //    tempHeight = label.height;
    //
    //        UIFontDescriptor *descriptor = font.fontDescriptor;
    //        NSNumber *fontSize = [descriptor objectForKey:@"NSFontSizeAttribute"];
    //        if (tempHeight < [fontSize floatValue]*2) {
    //            tempHeight = [fontSize floatValue];
    //        }
    //    return tempHeight;
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:checkNull(text)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    
    UIFontDescriptor *descriptor = font.fontDescriptor;
    NSNumber *fontSize = [descriptor objectForKey:@"NSFontSizeAttribute"];
    
    int textHeight = rect.size.height;
    if (textHeight < [fontSize floatValue]*2) {
        textHeight = [fontSize floatValue];
    }
    return textHeight+1;
    
}

#pragma makr - 荐语 专用
/*
 *  因图片和文字混合的地方,目前只有这一个地方用到,单独处理荐语label 的高度计算和行间距设置,上方的方法比较通用 不修改上面方法 在这单独开两个专门使用的方法
 */

+ (CGFloat)text:(NSString*)text heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing attachImage:(NSString *)attchImageName {
    CGFloat tempHeight = 0;
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, MAXFLOAT)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    [label setText:text lineSpacing:lineSpacing attachImage:attchImageName];
    [label sizeToFit];
    tempHeight = label.height;
    
    
    if (tempHeight < fontSize*2) { //一行
        tempHeight = fontSize;
    }
    return tempHeight;
}

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing attachImage:(NSString *)attchImageName {
    
    if (lineSpacing < 0.01 || !text) {
        self.text = text;
        return;
    }
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:attchImageName];
    attch.bounds = CGRectMake(0, -2.5, attch.image.size.width, attch.image.size.height); //-2.5 图片的高度比文字高度达 使用负值 图片和文字上下居中
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:(NSTextAttachment *)(attch)];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:checkNull(text)];
    
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    [attributedString insertAttributedString:string atIndex:0];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    [paragraphStyle setAlignment:NSTextAlignmentJustified];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

+ (UILabel *)craeteLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(float)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

@end
