//
//  DZNavItemButton.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZNavItemButton.h"

@implementation DZNavItemButton

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect imageFrame = self.imageView.frame;
    if (self.isLeft) {
        imageFrame.origin.x = 0;
    }else {
        imageFrame.origin.x = self.frame.size.width-imageFrame.size.width;
    }
    
    if (self.isBack) {
        imageFrame.origin.x = 5;
    }

    self.imageView.frame = imageFrame;
}

@end
