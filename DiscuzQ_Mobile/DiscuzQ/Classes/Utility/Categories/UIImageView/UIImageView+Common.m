//
//  UIImageView+Common.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/3/16.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "UIImageView+Common.h"
#import <YYWebImage.h>
#import <SDImageSVGKCoder.h>

@implementation UIImageView (Common)

// 查找UINavigationBar分割线
+ (UIImageView*)findHairlineImageViewUnder:(UIView*)view {
    if([view isKindOfClass:UIImageView.class] && view.bounds.size.height<=1.0) {
        return (UIImageView*)view;
    }
    for(UIView *subview in view.subviews) {
        UIImageView*imageView = [self findHairlineImageViewUnder:subview];
        if(imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)dz_setImageWithURL:(NSString *)imageURL{
    
    [self dz_internalSetImageWithURL:imageURL placeholder:nil options:0 completion:nil];
}

- (void)dz_setImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder{
    
    [self dz_internalSetImageWithURL:imageURL placeholder:placeholder options:0 completion:nil];
}

- (void)dz_setOptionImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder options:(YYWebImageOptions)options{
    
    [self dz_internalSetImageWithURL:imageURL placeholder:placeholder options:options completion:nil];
}

- (void)dz_setBlockImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder completion:(YYCompletion)completion{
    
    [self dz_internalSetImageWithURL:imageURL placeholder:placeholder options:YYWebImageOptionShowNetworkActivity completion:completion];
}


- (void)dz_internalSetImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder options:(YYWebImageOptions)options completion:(YYCompletion)completion{
    
    NSURL *urlObj = KURLString(imageURL);
    if ([urlObj.path.lowercaseString containsString:@".svg"] && [urlObj.absoluteString.lowercaseString containsString:@".svg"]) {
        CGSize svgSize = self.frame.size;
        SDImageSVGKCoder *svgCoder = [SDImageSVGKCoder sharedCoder];
        [[SDImageCodersManager sharedManager] addCoder:svgCoder];
        [self sd_setImageWithURL:urlObj placeholderImage:placeholder options:0 context:nil];
//        @{SDImageCoderDecodeThumbnailPixelSize : @(svgSize)}
    }else{
        [self yy_setImageWithURL:urlObj placeholder:placeholder options:options completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
            if (completion) {
                completion(image,url,error);
            }
        }];
    }
}

@end
