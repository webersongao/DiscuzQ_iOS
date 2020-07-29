//
//  DropTipView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/13.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DropTipView.h"
#import "UIButton+EnlargeEdge.h"

@interface DropTipView ()


@end

@implementation DropTipView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_myTipView];
    }
    return self;
}

- (void)config_myTipView {
    self.backgroundColor = [UIColor orangeColor];
    self.alpha = 0.8;
    
    [self addSubview:self.tipLabel];
    [self addSubview:self.closeBtn];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.width.equalTo(@(KScreenWidth - 80));
        make.top.bottom.equalTo(self);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(- 20);
        make.width.height.equalTo(@15);
        make.centerY.equalTo(self.tipLabel);
    }];
    
    [self.closeBtn setEnlargeEdgeWithTop:15 right:20 bottom:15 left:5];
}

- (void)clickTip {
    if (self.clickTipAction) {
        self.clickTipAction();
    }
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"type_close"] forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textAlignment =  NSTextAlignmentCenter;
        _tipLabel.font = KFont(14);
        _tipLabel.textColor = [UIColor whiteColor];
        _tipLabel.userInteractionEnabled = YES;
        [_tipLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTip)]];
    }
    return _tipLabel;
}

@end
