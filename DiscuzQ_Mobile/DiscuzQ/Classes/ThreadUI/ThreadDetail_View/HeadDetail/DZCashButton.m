//
//  DZCashButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZCashButton.h"

@implementation DZCashButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_CashButton];
        self.backgroundColor = KGreen_Color;
    }
    return self;
}


-(void)config_CashButton{
    
    self.layer.cornerRadius = 4.f;
    self.layer.masksToBounds = YES;
    self.titleLabel.font = KFont(16.f);
    [self setTitleColor:KWhite_Color forState:UIControlStateNormal];
    self.contentEdgeInsets = UIEdgeInsetsMake(kMargin5, kMargin20,kMargin5, kMargin20);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}





@end
