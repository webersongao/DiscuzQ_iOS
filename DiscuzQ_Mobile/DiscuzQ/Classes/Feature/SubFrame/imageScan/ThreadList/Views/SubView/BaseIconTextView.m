//
//  BaseIconTextView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/16.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "BaseIconTextView.h"

@implementation BaseIconTextView

- (instancetype)init {
    if (self = [super init]) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    self.iconV = [[UIImageView alloc] init];
    [self addSubview:self.iconV];
    
    self.textLab = [[UILabel alloc] init];
    self.textLab.textAlignment = NSTextAlignmentLeft;
    self.textLab.textColor = KGray_Color;
    self.textLab.font = KFont(12);
    [self addSubview:self.textLab];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconV.frame = CGRectMake(CGRectGetWidth(self.frame) / 2 - 23, 10, 16, 16);
    self.textLab.frame = CGRectMake(CGRectGetMaxX(self.iconV.frame) + 5, CGRectGetMinY(self.iconV.frame), CGRectGetWidth(self.frame) / 2, 16);
    
}

@end
