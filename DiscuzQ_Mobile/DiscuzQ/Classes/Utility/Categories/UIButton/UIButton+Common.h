//
//  UIButton+Common.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/11/6.
//
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"

typedef void (^YKCompletion)(UIImage * _Nullable image,NSURL * _Nullable url, NSError * _Nullable error);

@interface UIButton (Common)

/// 设置按钮的三个状态图片
- (void)setNormalImage:(NSString *)normalImage HighlightedImage:(NSString *)highlightedImage selectedImage:(NSString *)selectedImage;

//// 创建一个纯文字按钮
+(UIButton *)ButtonTextWithFrame:(CGRect)frame titleStr:(NSString *)titleStr titleColor:(UIColor *)titleColor titleTouColor:(UIColor *)titleTouColor font:(UIFont *)font Radius:(CGFloat)Radius Target:(id)target action:(SEL)btnAction;

/// 创建 普通 按钮
+ (UIButton *)ButtonNormalWithFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage;

- (void)dz_setImageWithURL:(NSString *)imageURL;

- (void)dz_setImageWithURL:(NSString *)imageURL forState:(UIControlState)state;


- (void)dz_setOptionImageWithURL:(NSString *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options;

- (void)dz_setImageWithURL:(NSString *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder;

- (void)dz_setBlockImageWithURL:(NSString *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options completion:(YKCompletion)completion;

@end
