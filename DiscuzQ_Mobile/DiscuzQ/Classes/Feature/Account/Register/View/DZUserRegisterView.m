//
//  DZUserRegisterView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/11.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZUserRegisterView.h"
#import "DZTextField.h"
#import "DZShareCenter.h"

@implementation DZUserRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self P_setupViews];
    }
    return self;
}

- (void)P_setupViews {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *nameImageV = [[UIImageView alloc] init];
    nameImageV.image = [UIImage imageNamed:DZ_Logo_image];
    nameImageV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:nameImageV];
    [nameImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(50);
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(35);
    }];
    
    IQPreviousNextView *contentView = [[IQPreviousNextView alloc] init];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor redColor];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat cwidth = CGRectGetWidth(self.frame) - 80;
        make.width.mas_equalTo(cwidth);
        make.top.equalTo(nameImageV.mas_bottom).offset(50);
//        make.height.mas_equalTo(200);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    
    self.usernameView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_u")];
    self.usernameView.inputField.tag = 101;
    self.usernameView.inputField.delegate = self;
    self.usernameView.inputField.placeholder = @"用户名为3-15位";
    [contentView addSubview:self.usernameView];
    [self.usernameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(contentView);
        make.top.equalTo(contentView.mas_top);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(contentView.mas_left);
    }];
    
    self.passwordView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_p")];
    self.passwordView.inputField.tag = 102;
    self.passwordView.inputField.delegate = self;
    self.passwordView.inputField.placeholder = @"密码";
    self.passwordView.inputField.secureTextEntry = YES;
    [contentView addSubview:self.passwordView];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.usernameView.mas_width);
        make.top.equalTo(self.usernameView.mas_bottom);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(self.usernameView.mas_left);
    }];
    
    self.repassView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_r")];
    self.repassView.inputField.placeholder = @"重复密码";
    self.repassView.inputField.tag = 103;
    self.repassView.inputField.secureTextEntry = YES;
    self.repassView.inputField.delegate = self;
    [contentView addSubview:self.repassView];
    [self.repassView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.passwordView.mas_width);
        make.top.equalTo(self.passwordView.mas_bottom);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(self.passwordView.mas_left);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.repassView);
    }];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.cs_acceptEventInterval = 1;
    [self addSubview:self.registerButton];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    self.registerButton.backgroundColor = K_Color_Theme;
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView);
        make.top.equalTo(self.repassView.mas_bottom).offset(16);
        make.width.mas_equalTo(contentView.mas_width);
        make.height.mas_equalTo(45);
    }];
    
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 5.0;
    
    [self.registerButton layoutIfNeeded];
    
    _usertermsView = [[DZTermsLabel alloc] init];
    [self addSubview:_usertermsView];
    
    [self addSubview:self.thridAuthTipLabl];
    [self.thridAuthTipLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.registerButton);
        make.top.equalTo(self.usertermsView.mas_bottom).offset(5);
    }];
    self.thridAuthTipLabl.hidden = YES;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    _usertermsView.frame = CGRectMake(CGRectGetMinX(_registerButton.frame), CGRectGetMaxY(_registerButton.frame) + 10, KScreenWidth, 44);
    CGFloat contentHeight = self.frame.size.height + 1;
    if (CGRectGetMaxY(_usertermsView.frame) + 50 > contentHeight) {
        contentHeight = CGRectGetMaxY(_usertermsView.frame) + 50;
    }
    self.contentSize = CGSizeMake(KScreenWidth, contentHeight);
}

- (UILabel *)thridAuthTipLabl {
    if (!_thridAuthTipLabl) {
        _thridAuthTipLabl = [[UILabel alloc] init];
        _thridAuthTipLabl.numberOfLines = 0;
    }
    return _thridAuthTipLabl;
}

@end
