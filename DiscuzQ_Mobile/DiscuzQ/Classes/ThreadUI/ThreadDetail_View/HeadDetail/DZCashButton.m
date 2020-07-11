//
//  DZCashButton.m
//  DiscuzQ
//
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
    self.titleLabel.font = KFont(15.f);
    [self setTitleColor:KWhite_Color forState:UIControlStateNormal];
}





@end
