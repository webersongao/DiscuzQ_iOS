//
//  DZHorizontalButton.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZHorizontalButton.h"

@implementation DZHorizontalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCommit];
    }
    return self;
}

- (void)initCommit {
    self.iconV = [[UIImageView alloc] init];
    [self addSubview:self.iconV];
    
    self.textLabel = [[UILabel alloc] init];
    [self addSubview:self.textLabel];
    self.textLabel.font = KFont(14);
    self.textLabel.textColor = KTitle_Color;
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.font = KFont(14);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconV.frame = CGRectMake(0, (self.height-25)/2.f, 25, 25);
    self.textLabel.frame = CGRectMake(CGRectGetMaxY(self.iconV.frame) + 10, 0, 150, self.height);
}


@end
