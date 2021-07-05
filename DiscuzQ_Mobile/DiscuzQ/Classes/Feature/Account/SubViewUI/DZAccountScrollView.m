//
//  DZAccountScrollView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAccountScrollView.h"

@interface DZAccountScrollView ()

@end

@implementation DZAccountScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_subAccountViews];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)config_subAccountViews {
    
    [self addSubview:self.logoView];
    [self addSubview:self.regContentView];
    
    [self.regContentView addSubview:self.firstField];
    [self.regContentView addSubview:self.secendField];
    [self.regContentView addSubview:self.thirdField];
    
    [self addSubview:self.actionButton];
    
    self.regContentView.height = CGRectGetMaxY(self.secendField.frame);
    self.actionButton.top = self.regContentView.bottom + kMargin30;
}

#pragma mark   /*************** 初始化 ***************/

- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-60)/2.0, 50, 60, 60)];
        _logoView.image = [UIImage imageNamed:DZ_Logo_image];
        _logoView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _logoView;
}


-(IQPreviousNextView *)regContentView{
    if (!_regContentView) {
        _regContentView = [[IQPreviousNextView alloc] initWithFrame:CGRectMake(40, self.logoView.bottom+40, self.width-80, 200)];
    }
    return _regContentView;
}

-(DZTextField *)firstField{
    if (!_firstField) {
        _firstField = [[DZTextField alloc] initWithFrame:CGRectMake(0, 0, self.regContentView.width, K_input_Height) Left:KImageNamed(@"log_u") placeholder:@"用户名为3-15位"];
        [_thirdField updateInputtag:101 secureTextEntry:NO];
    }
    return _firstField;
}

-(DZTextField *)secendField{
    if (!_secendField) {
        _secendField = [[DZTextField alloc] initWithFrame:CGRectMake(0, self.firstField.bottom, self.regContentView.width, K_input_Height) Left:KImageNamed(@"log_p") placeholder:@"密码"];
        [_secendField updateInputtag:102 secureTextEntry:YES];
    }
    return _secendField;
}


-(DZTextField *)thirdField{
    if (!_thirdField) {
        _thirdField = [[DZTextField alloc] initWithFrame:CGRectMake(0, self.secendField.bottom, self.regContentView.width, K_input_Height) Left:KImageNamed(@"log_r") placeholder:@"重复密码"];
        [_thirdField updateInputtag:103 secureTextEntry:YES];
        _thirdField.hidden = YES;
    }
    return _thirdField;
}


-(UIButton *)actionButton{
    if (!_actionButton) {
        _actionButton = [[UIButton alloc] initWithFrame:CGRectMake(self.regContentView.left, self.regContentView.bottom + 40, self.regContentView.width, kToolBarHeight)];
        _actionButton.layer.cornerRadius = 5.0;
        _actionButton.layer.masksToBounds = YES;
        _actionButton.cs_acceptEventInterval = 1;
        _actionButton.backgroundColor = KGreen_Color;
        [_actionButton setTitle:@"注册" forState:UIControlStateNormal];
    }
    return _actionButton;
}



@end
