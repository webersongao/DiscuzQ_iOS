//
//  NSString+Common.h
//  DiscuzQ
//
//  Created by Gao on 17/6/17.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点型
- (BOOL)isPureFloat;

+(NSString *)decodeString:(NSString*)strUrl;

+(NSString *)encodeString:(NSString*)strUrl;

//检测是否是充值选择金额页面
- (BOOL)checkisContainTBValueUrl;

- (NSArray *)stringToNSArray;

- (NSNumber *)stringToNumber;

+ (NSString *)PRImagePath:(NSString *)imageName;

+ (NSDictionary *)DZParamsURL:(NSString *)url;

+ (NSDictionary *)DZParamsURLNoneDecode:(NSString *)url;

//删除所有的空格及换行
+ (NSString *)removeSpaceAndNewline:(NSString *)str;

// 计算 文字的高度 宽度
+ (CGFloat)cacaulteStringWidth:(NSString *)str fontSize:(int)fontSize;

- (CGFloat)cacaulteStringWidth:(CGFloat)fontSize maxHeight:(CGFloat)height;

+ (CGFloat)cacaulteStringHeight:(NSString *)str fontSize:(int)fontSize width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;



//-(CGFloat)textWidthWithSize:(CGSize)size font:(UIFont*)font;
//
//-(CGFloat)textHeightWithSize:(CGSize)size font:(UIFont*)font;


- (CGSize)customSizeWithFont:(UIFont *)font;
//- (CGSize)customSizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;
//// Single line, no wrapping. Truncation based on the NSLineBreakMode.
//- (CGSize)customDrawAtPoint:(CGPoint)point withFont:(UIFont *)font;
//
//- (CGSize)customDrawAtPoint:(CGPoint)point forWidth:(CGFloat)width withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
//
//// Wrapping to fit horizontal and vertical size.
//- (CGSize)customDrawInRect:(CGRect)rect withFont:(UIFont *)font;
//- (CGSize)customDrawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode;
//
//- (CGSize)customSizeWithFont:(UIFont *)font minFontSize:(CGFloat)minFontSize actualFontSize:(CGFloat *)actualFontSize forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
