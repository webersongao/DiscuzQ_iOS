//
//  EmptyAlertView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/4/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "EmptyAlertView.h"

@implementation EmptyAlertView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configEmptyView];
    }
    return self;
}

- (void)configEmptyView {
    
    self.backgroundColor = KWhite_Color;
    self.emptyIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:DZ_Empty_image]];
    self.emptyIcon.frame = CGRectMake(0, 0, 160, 140);
    self.emptyIcon.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
    
    [self addSubview:self.emptyIcon];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.emptyIcon.frame = CGRectMake(0, 0, 150, 131.25);
    self.emptyIcon.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2 - 50);
}



@end
