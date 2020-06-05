//
//  UIImageView+Common.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/3/16.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "UIImageView+Common.h"

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

    [self yy_setImageWithURL:KURLString(imageURL) placeholder:nil options:YYWebImageOptionShowNetworkActivity completion:nil];
}

- (void)dz_setImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder{

    [self yy_setImageWithURL:KURLString(imageURL) placeholder:placeholder options:YYWebImageOptionShowNetworkActivity completion:nil];
}

- (void)dz_setOptionImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder options:(YYWebImageOptions)options{

    [self yy_setImageWithURL:KURLString(imageURL) placeholder:placeholder options:YYWebImageOptionShowNetworkActivity completion:nil];
}

- (void)dz_setBlockImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder options:(YYWebImageOptions)options completion:(YYCompletion)completion{

    [self yy_setImageWithURL:KURLString(imageURL) placeholder:placeholder options:YYWebImageOptionShowNetworkActivity completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        if (completion) {
            completion(image,url,error);
        }
    }];
}

@end
