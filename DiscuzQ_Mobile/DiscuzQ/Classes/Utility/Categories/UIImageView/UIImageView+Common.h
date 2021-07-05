//
//  UIImageView+Common.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/3/16.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YYCompletion)(UIImage * _Nullable image,NSURL * _Nullable url, NSError * _Nullable error);

@interface UIImageView (Common)

// 查找UINavigationBar分割线

+ (UIImageView *)findHairlineImageViewUnder:(UIView*)view;

- (void)dz_setImageWithURL:(NSString *)imageURL;

- (void)dz_setImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder;

- (void)dz_setOptionImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder options:(YYWebImageOptions)options;

- (void)dz_setBlockImageWithURL:(NSString *)imageURL placeholder:(UIImage *)placeholder completion:(YYCompletion)completion;
    
    
    
    
    
    
@end
