//
//  UILabel+TopTitle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AttchPosition) {
    P_before,
    P_after
};

@interface UILabel (TopTitle)

- (void)setText:(NSString *)text andImageName:(NSString *)imageName andSize:(CGSize)size andPosition:(AttchPosition)position;

- (void)setText:(NSString *)text andImage:(UIImage *)image andSize:(CGSize)size andPosition:(AttchPosition)position;

@end


