//
//  NSString+Common.m
//  DiscuzQ
//
//  Created by Gao on 17/6/17.
//
//

#import "NSString+Common.h"

#define MaxHeight 1000

@implementation NSString (Common)

//判断是否为整形
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点型
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)checkisContainTBValueUrl
{
    NSString *regex = @"^.*tb=([0-9a-zA-Z]+).*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:self] )
    {
        return YES;
    }
    return NO;
}

- (NSArray *)stringToNSArray{
    if (self.length) {
        NSString * muString = [NSString removeSpaceAndNewline:self];
        muString = [muString stringByReplacingOccurrencesOfString:@"(" withString:@""];
        muString = [muString stringByReplacingOccurrencesOfString:@")" withString:@""];
        
        NSArray *localArr =  [muString componentsSeparatedByString:@","];
        return localArr;
    }
    return nil;
}

- (NSNumber *)stringToNumber {
    NSInteger integer = [self integerValue];
    NSNumber *number = [NSNumber numberWithInteger:integer];
    return number;
}

+ (NSString *)PRImagePath:(NSString *)imageName
{
    NSString * itemPath = [NSString stringWithFormat:@"skin/onlineMenu/%@",imageName];
    return itemPath;
}

// 将url的参数部分转化成字典
+ (NSDictionary *)DZParamsURL:(NSString *)url
{
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    if (NSNotFound != [url rangeOfString:@"?"].location) {
        NSString *paramString = [url substringFromIndex:
                                 ([url rangeOfString:@"?"].location + 1)];
        NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner* scanner = [[NSScanner alloc] initWithString:paramString];
        while (![scanner isAtEnd]) {
            NSString* pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString* key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
                NSString* value = [[kvPair objectAtIndex:1] stringByRemovingPercentEncoding];
                [pairs setValue:value forKey:key];
            }else if (kvPair.count > 2){
                NSString* key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
                NSString* keyStr = [NSString stringWithFormat:@"%@",key];
                NSString* value = [pairString substringFromIndex:keyStr.length+1];
                [pairs setValue:value forKey:key];
            }
        }
    }else if ([url containsString:@"="]){
        NSString *pairString = [NSString stringWithFormat:@"%@",url];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
            NSString* value = [[kvPair objectAtIndex:1] stringByRemovingPercentEncoding];
            [pairs setValue:value forKey:key];
        }else if (kvPair.count > 2){
            NSString* key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
            NSString* keyStr = [NSString stringWithFormat:@"%@",key];
            NSString* value = [pairString substringFromIndex:keyStr.length+1];
            [pairs setValue:value forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

+ (NSDictionary *)DZParamsURLNoneDecode:(NSString *)url
{
    
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    if (NSNotFound != [url rangeOfString:@"?"].location) {
        NSString *paramString = [url substringFromIndex:
                                 ([url rangeOfString:@"?"].location + 1)];
        NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner* scanner = [[NSScanner alloc] initWithString:paramString];
        while (![scanner isAtEnd]) {
            NSString* pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString* key = [kvPair objectAtIndex:0];
                NSString* value = [kvPair objectAtIndex:1];
                [pairs setValue:value forKey:key];
            }else if (kvPair.count > 2){
                NSString* key = [kvPair objectAtIndex:0];
                NSString* keyStr = [NSString stringWithFormat:@"%@",key];
                NSString* value = [pairString substringFromIndex:keyStr.length+1];
                [pairs setValue:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

+(NSString *)decodeString:(NSString*)strUrl
{
    //使用系统的decode,有问题统一在这里改.
    strUrl = [strUrl stringByReplacingOccurrencesOfString:@"+" withString:@"%20"];
    NSString *str = [strUrl stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return str;
}

+(NSString *)encodeString:(NSString*)strUrl
{
    //使用系统的encode,有问题统一在这里改.
    NSString *str = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return str;
}

//删除所有的空格及换行
+ (NSString *)removeSpaceAndNewline:(NSString *)str
{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}

+ (CGFloat)cacaulteStringWidth:(NSString *)str fontSize:(int)fontSize {
    
    NSString *string = [NSString stringWithFormat:@"%@",str];
    if (!string.length) {
        return 0;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],};

CGSize textSize = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 0) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;

return textSize.width;
}

/**
 获取字符串的宽度
 */
- (CGFloat)cacaulteStringWidth:(CGFloat)fontSize maxHeight:(CGFloat)height
{
    if (!self.length) {
        return 0;
    }
    if (fontSize < 1) {
        fontSize = 14.0;
    }
    if (height < 1) {
        height = 14.0;
    }
    NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};  //指定字号
CGRect rect = [self boundingRectWithSize:CGSizeMake(0, height)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading attributes:fontDict context:nil];
return rect.size.width;
}

+ (CGFloat)cacaulteStringHeight:(NSString *)str fontSize:(int)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing
{
    NSString *string = checkNull(str);
    if (!string.length) {
        return 0;
    }
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};

CGSize textSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;

textSize.height = ceil(textSize.height);
return textSize.height;
}



-(CGFloat)textWidthWithSize:(CGSize)size font:(UIFont*)font{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
}

-(CGFloat)textHeightWithSize:(CGSize)size font:(UIFont*)font{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height;
}


- (CGSize)customSizeWithFont:(UIFont *)font
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                nil];
    return [self sizeWithAttributes:attributes];
}

- (NSParagraphStyle*)getCustomStringParagraphStyle:(NSLineBreakMode)linebreakMode
{
    NSMutableParagraphStyle *mps = [[NSMutableParagraphStyle alloc] init];
    if (linebreakMode >= 0)
    {
        [mps setLineBreakMode:linebreakMode];
    }
    
    return (NSParagraphStyle *)mps;
}

- (CGSize)customSizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;
{
    NSParagraphStyle *style = [self getCustomStringParagraphStyle:lineBreakMode];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                style,NSParagraphStyleAttributeName,
                                nil];
    [self boundingRectWithSize:CGSizeMake(width,MaxHeight) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil];
    return CGSizeMake(width,MaxHeight);
    
}

// Single line, no wrapping. Truncation based on the NSLineBreakMode.
- (CGSize)customDrawAtPoint:(CGPoint)point withFont:(UIFont *)font
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                nil];
    [self drawAtPoint:point withAttributes:attributes];
    return CGSizeZero;
}

- (CGSize)customDrawAtPoint:(CGPoint)point forWidth:(CGFloat)width withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSParagraphStyle *style = [self getCustomStringParagraphStyle:lineBreakMode];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                style,NSParagraphStyleAttributeName,
                                nil];
    [self drawAtPoint:point withAttributes:attributes];
    return CGSizeZero;
}

// Wrapping to fit horizontal and vertical size. Text will be wrapped and truncated using the NSLineBreakMode. If the height is less than a line of text, it may return
// a vertical size that is bigger than the one passed in.
// If you size your text using the constrainedToSize: methods below, you should draw the text using the drawInRect: methods using the same line break mode for consistency
- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                nil];
    [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil];
    return size;
}

- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSParagraphStyle *style = [self getCustomStringParagraphStyle:lineBreakMode];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                style,NSParagraphStyleAttributeName,
                                nil];
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil];
    return rect.size;
}

// Wrapping to fit horizontal and vertical size.
- (CGSize)customDrawInRect:(CGRect)rect withFont:(UIFont *)font
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                nil];
    [self drawInRect:rect withAttributes:attributes];
    return rect.size;
}

- (CGSize)customDrawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSParagraphStyle *style = [self getCustomStringParagraphStyle:lineBreakMode];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                style,NSParagraphStyleAttributeName,
                                nil];
    [self drawInRect:rect withAttributes:attributes];
    return rect.size;
}

- (CGSize)customSizeWithFont:(UIFont *)font minFontSize:(CGFloat)minFontSize actualFontSize:(CGFloat *)actualFontSize forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    //有问题？
    NSParagraphStyle *style = [self getCustomStringParagraphStyle:lineBreakMode];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font, NSFontAttributeName,
                                style,NSParagraphStyleAttributeName,
                                nil];
    return [self sizeWithAttributes:attributes];
}


@end




