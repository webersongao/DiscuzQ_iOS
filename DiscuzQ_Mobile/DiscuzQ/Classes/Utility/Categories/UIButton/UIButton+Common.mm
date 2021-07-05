//
//  UIButton+Common.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/11/6.
//
//

#import "UIButton+Common.h"
#import <YYWebImage.h>
#import <SDImageSVGKCoder.h>

@implementation UIButton (Common)

///  创建一个文字按钮 (文字居中)
+(UIButton *)ButtonTextWithFrame:(CGRect)frame titleStr:(NSString *)titleStr titleColor:(UIColor *)titleColor titleTouColor:(UIColor *)titleTouColor font:(UIFont *)font Radius:(CGFloat)Radius Target:(id)target action:(SEL)btnAction{
    
    UIButton *tmpButton = [[UIButton alloc]initWithFrame:frame];
    tmpButton.backgroundColor = [UIColor clearColor];
    if (titleStr.length) {
        [tmpButton setTitle:titleStr forState: UIControlStateNormal];
    }
    if (font) {
        tmpButton.titleLabel.font = font;
    }
    if (Radius > 0) {
        tmpButton.layer.cornerRadius = Radius;
        [tmpButton.layer masksToBounds];
    }
    [tmpButton setTitleColor:titleColor forState:UIControlStateNormal];
    [tmpButton setTitleColor:titleTouColor forState:UIControlStateSelected];
    [tmpButton setTitleColor:titleTouColor forState:UIControlStateHighlighted];
    if (target && btnAction) {
        [tmpButton addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    }
    tmpButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    return tmpButton;
}



- (void)setNormalImage:(NSString *)normalImage HighlightedImage:(NSString *)highlightedImage selectedImage:(NSString *)selectedImage{
    
    [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highlightedImage]  forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:selectedImage]  forState:UIControlStateSelected];
}

/// 创建 图片 按钮
+ (UIButton *)ButtonImageWithFrame:(CGRect)frame normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage
{
    return [UIButton ButtonWithFrame:frame title:nil titleFont:nil titleColor:nil titleSeleColor:nil normalImgPath:normalPath touchImgPath:touchUpPath isBackImage:isBackImage picAlpha:1];
}

/// 创建 图片 按钮
+ (UIButton *)ButtonImageWithFrame:(CGRect)frame normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage picAlpha:(CGFloat)alpha
{
    return [UIButton ButtonWithFrame:frame title:nil titleFont:nil titleColor:nil titleSeleColor:nil normalImgPath:normalPath touchImgPath:touchUpPath isBackImage:isBackImage picAlpha:alpha];
}

/// 创建 图片 按钮 (点击事件)
+ (UIButton *)ButtonImageWithFrame:(CGRect)frame normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage  Target:(id)target action:(SEL)btnAction{

    UIButton *tmpButton = [UIButton ButtonWithFrame:frame title:nil titleFont:nil titleColor:nil titleSeleColor:nil normalImgPath:normalPath touchImgPath:touchUpPath isBackImage:isBackImage picAlpha:1];
    
    if (target && btnAction) {
        [tmpButton addTarget:target action:btnAction forControlEvents:UIControlEventTouchUpInside];
    }
    
    return tmpButton;
}

/// 创建 普通 按钮
+ (UIButton *)ButtonNormalWithFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage picAlpha:(CGFloat)alpha
{
    return [UIButton ButtonWithFrame:frame title:title titleFont:titleFont titleColor:titleColor titleSeleColor:titleColor normalImgPath:normalPath touchImgPath:touchUpPath isBackImage:isBackImage picAlpha:alpha];
}

+ (UIButton *)ButtonWithFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor titleSeleColor:(UIColor *)seletedColor normalImgPath:(NSString *)normalPath touchImgPath:(NSString*)touchUpPath isBackImage:(BOOL)isBackImage picAlpha:(CGFloat)alpha{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    if (titleFont) {
        button.titleLabel.font = titleFont;
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (seletedColor) {
        [button setTitleColor:seletedColor forState:UIControlStateSelected];
    }else{
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    if (nil != normalPath) {
        UIImage *normalImage = [[UIImage imageNamed:normalPath] dz_imageWithAlpha:alpha];
        if (isBackImage) {
            [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        } else {
            [button setImage:normalImage forState:UIControlStateNormal];
        }
        
    }
    
    if (nil != touchUpPath) {
        
        UIImage *touchUpImage = [[UIImage imageNamed:touchUpPath] dz_imageWithAlpha:alpha];
        
        if (isBackImage) {
            [button setBackgroundImage:touchUpImage forState:UIControlStateHighlighted];
            [button setBackgroundImage:touchUpImage forState:UIControlStateSelected];
        } else {
            [button setImage:touchUpImage forState:UIControlStateHighlighted];
            [button setImage:touchUpImage forState:UIControlStateSelected];
        }
    }
    return button;
}


- (void)dz_setImageWithURL:(NSString *)imageURL{
    
    [self dz_setImageWithURL:imageURL forState:UIControlStateNormal];
    [self dz_setImageWithURL:imageURL forState:UIControlStateHighlighted];
}


- (void)dz_setImageWithURL:(NSString *)imageURL forState:(UIControlState)state{
    
    [self btn_internalSetImageWithURL:imageURL isBackground:NO placeholder:nil forState:state options:0 completion:nil];
}


- (void)dz_setOptionImageWithURL:(NSString *)imageURL forState:(UIControlState)state options:(YYWebImageOptions)options{
    [self btn_internalSetImageWithURL:imageURL isBackground:NO placeholder:nil forState:state options:options completion:nil];
}

- (void)dz_setImageWithURL:(NSString *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder {
    [self btn_internalSetImageWithURL:imageURL isBackground:NO placeholder:placeholder forState:state options:0 completion:nil];
}

- (void)dz_setBackImageWithURL:(NSString *)imageURL forState:(UIControlState)state{
    [self btn_internalSetImageWithURL:imageURL isBackground:YES placeholder:nil forState:state options:0 completion:nil];
}

- (void)dz_setBackImageWithURL:(NSString *)imageURL forState:(UIControlState)state placeholder:(UIImage *)placeholder {
    [self btn_internalSetImageWithURL:imageURL isBackground:YES placeholder:placeholder forState:state options:0 completion:nil];
}

- (void)dz_setBlockImageWithURL:(NSString *)imageURL forState:(UIControlState)state completion:(YKCompletion)completion{
    
    [self btn_internalSetImageWithURL:imageURL isBackground:NO placeholder:nil forState:state options:YYWebImageOptionShowNetworkActivity completion:completion];
}

- (void)btn_internalSetImageWithURL:(NSString *)imageURL isBackground:(BOOL)isBack placeholder:(UIImage *)placeholder forState:(UIControlState)state options:(YYWebImageOptions)options completion:(YKCompletion)completion{
    
    NSURL *urlObj = KURLString(imageURL);
    BOOL isSVG = ([urlObj.path.lowercaseString containsString:@".svg"] && [urlObj.absoluteString.lowercaseString containsString:@".svg"]);
    
    if (isSVG) {
        SDImageSVGKCoder *svgCoder = [SDImageSVGKCoder sharedCoder];
        [[SDImageCodersManager sharedManager] addCoder:svgCoder];
//        CGSize svgSize = isBack ? self.frame.size : self.imageView.frame.size;
//        NSDictionary *context = @{SDImageCoderDecodeThumbnailPixelSize : @(svgSize)};
        if (isBack) {
            [self sd_setBackgroundImageWithURL:urlObj forState:state placeholderImage:placeholder options:0 context:nil];
        }else{
            //TODO: SVG 似乎会显示位置错误
            [self sd_setImageWithURL:urlObj forState:state placeholderImage:placeholder options:0 context:nil];
        }
    }else{
        if (isBack) {
            [self yy_setBackgroundImageWithURL:urlObj forState:state placeholder:placeholder options:options completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                if (completion) { completion(image,url,error);}
            }];
        }else{
            [self yy_setImageWithURL:urlObj forState:state placeholder:placeholder options:options completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                if (completion) { completion(image,url,error);}
            }];
        }
    }
}

-(void)layoutItemButtonWithTitle:(NSString *)title titleH:(NSString *)titleH image:(NSString *)image imageH:(NSString *)imageH imageTitleSpace:(CGFloat)space;{
    self.layer.cornerRadius = 3.f;
    self.layer.masksToBounds = YES;
    self.titleLabel.font = KFont(12.f);
    self.backgroundColor = KDarkLine_Color;
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:titleH forState:UIControlStateSelected];
    [self setTitle:titleH forState:UIControlStateHighlighted];
    
    [self setTitleColor:KGray_Color forState:UIControlStateNormal];
    [self setTitleColor:KGreen_Color forState:UIControlStateSelected];
    [self setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self setImage:KImageNamed(image) forState:UIControlStateNormal];
    [self setImage:KImageNamed(imageH) forState:UIControlStateHighlighted];
    [self layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:space];
    self.contentEdgeInsets = UIEdgeInsetsMake(kMargin5, kMargin10, kMargin5, kMargin10);
    [self sizeToFit];
}


@end

















