//
//  DZResetPwdView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/17.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZResetPwdView.h"
#import "DZTextField.h"

@implementation DZResetPwdView

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
    self.backgroundColor = KWhite_Color;
    
    IQPreviousNextView *contentView = [[IQPreviousNextView alloc] init];
    [self addSubview:contentView];
    contentView.backgroundColor = [UIColor redColor];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat cwidth = CGRectGetWidth(self.frame) - 80;
        make.width.mas_equalTo(cwidth);
        make.top.equalTo(self).offset(50);
        //        make.height.mas_equalTo(200);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    
    self.passwordView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_p")];
    self.passwordView.inputField.tag = 102;
    self.passwordView.inputField.delegate = self;
    self.passwordView.inputField.placeholder = @"旧密码";
    self.passwordView.inputField.secureTextEntry = YES;
    [contentView addSubview:self.passwordView];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(contentView);
        make.top.equalTo(contentView.mas_top);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(contentView.mas_left);
    }];
    
    self.newpasswordView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_p")];
    [contentView addSubview:self.newpasswordView];
    self.newpasswordView.backgroundColor = KWhite_Color;
    self.newpasswordView.inputField.placeholder = @"新密码";
    self.newpasswordView.inputField.delegate = self;
    self.newpasswordView.inputField.secureTextEntry = YES;
    [self.newpasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.passwordView.mas_width);
        make.top.equalTo(self.passwordView.mas_bottom);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(self.passwordView.mas_left);
    }];
    
    self.repassView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_r")];
    self.repassView.inputField.placeholder = @"重复新密码";
    self.repassView.inputField.tag = 103;
    self.repassView.inputField.secureTextEntry = YES;
    self.repassView.inputField.delegate = self;
    [contentView addSubview:self.repassView];
    [self.repassView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.newpasswordView);
        make.top.equalTo(self.newpasswordView.mas_bottom);
        make.width.equalTo(self.newpasswordView.mas_width);
        make.height.mas_equalTo(K_input_Height);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.repassView);
    }];
    
    self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitButton.cs_acceptEventInterval = 1;
    [self addSubview:self.submitButton];
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    self.submitButton.backgroundColor = KGreen_Color;
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView);
        make.top.equalTo(self.repassView.mas_bottom).offset(16);
        make.width.mas_equalTo(contentView.mas_width);
        make.height.mas_equalTo(45);
    }];
    
    self.submitButton.layer.masksToBounds = YES;
    self.submitButton.layer.cornerRadius = 5.0;
    
    [self.submitButton layoutIfNeeded];
    
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat contentHeight = self.frame.size.height + 1;
    if (CGRectGetMaxY(_submitButton.frame) + 50 > contentHeight) {
        contentHeight = CGRectGetMaxY(_submitButton.frame) + 50;
    }
    self.contentSize = CGSizeMake(KScreenWidth, contentHeight);
}



@end
