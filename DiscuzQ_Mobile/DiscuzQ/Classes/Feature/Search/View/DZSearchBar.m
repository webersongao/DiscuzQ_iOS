//
//  DZSearchBar.m
//  DiscuzQ
//
//  Created by piter on 2018/1/22.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZSearchBar.h"

@implementation DZSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.layer.borderWidth = 1;
    self.layer.borderColor = KLine_Color.CGColor;
    self.backgroundColor = KLightLine_Color;
    self.layer.cornerRadius = 14;
    self.layer.masksToBounds = YES;
    self.placeholder = @"关键字";
    UIImage* searchBarBg = [UIImage createImageWithColor:KLightLine_Color andHeight:30.0f];
    //设置背景图片
    [self setBackgroundImage:searchBarBg];
    //设置文本框背景
    [self setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
}

@end
