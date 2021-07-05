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

+ (NSString *)decodeString:(NSString*)strUrl;

+ (NSString *)encodeString:(NSString*)strUrl;

+ (NSString *)StringValueFromObject:(id)value;

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


//英文字母
+(BOOL)yingwenzimu:(NSString *)str;
//用户名  手机号
+(BOOL)yonghuming:(NSString *)str;
+(BOOL)shoujihao:(NSString *)str;
//验证码 密码
+(BOOL)yanzhengma:(NSString *)str;
+(BOOL)mima:(NSString *)str;
//身份证号 邮箱
+(BOOL)shenfenzheng:(NSString *)str;
+(BOOL)youxiang:(NSString *)str;

/// 是否是首页地址 http://www.baidu.com
-(BOOL)isSiteHomeUrl;

/// 是否是域名 www.baidu.com
-(BOOL)isSiteDomain;

/// 是否是网页url http://www.tetet.com/index.html?q=1&m=test
-(BOOL)isSitePageUrl;


@end
