//
//  DZUserLoginView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/10.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZUserLoginView.h"
#import "DZShareCenter.h"

@interface DZUserLoginView ()

@end

@implementation DZUserLoginView

-(instancetype)initWithFrame:(CGRect)frame isQQ:(BOOL)isQQ isWx:(BOOL)isWx {
    if (self = [super initWithFrame:frame]) {
        [self p_setupViewWithQQ:isQQ isWx:isWx];
    }
    return self;
}

- (void)p_setupViewWithQQ:(BOOL)isQQ isWx:(BOOL)isWx {
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.showsVerticalScrollIndicator = NO;
    
    [self layoutLoginViewWithQQ:isQQ isWx:isWx];
}

- (void)layoutLoginViewWithQQ:(BOOL)isQQ isWx:(BOOL)isWx {
    
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
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat cwidth = CGRectGetWidth(self.frame) - 80;
        make.width.mas_equalTo(cwidth);
        make.top.equalTo(nameImageV.mas_bottom).offset(50);
        make.left.equalTo(self.mas_left).offset(40);
    }];
    
    [contentView addSubview:self.nameView];
    [self.nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(contentView);
        make.top.equalTo(contentView.mas_top);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(contentView.mas_left);
    }];
    
    [contentView addSubview:self.pwordView];
    [self.pwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.nameView.mas_width);
        make.top.equalTo(self.nameView.mas_bottom);
        make.height.mas_equalTo(K_input_Height);
        make.left.equalTo(contentView.mas_left);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pwordView);
    }];
    
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView.mas_left);
        make.top.equalTo(contentView.mas_bottom).offset(kMargin30);
        make.width.mas_equalTo(contentView.mas_width);
        make.height.mas_equalTo(45);
    }];
    
    [self addSubview:self.forgetBtn];
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginBtn.mas_right);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(5);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(25);
    }];
    
    [self addSubview:self.thridAuthTipLabl];
    [self.thridAuthTipLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.loginBtn);
        make.top.equalTo(self.forgetBtn.mas_bottom).offset(5);
    }];
    self.thridAuthTipLabl.hidden = YES;
    
    [self addSubview:self.thirdView];
    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn.mas_left);
        make.top.equalTo(self.thridAuthTipLabl.mas_bottom).offset(30);
        make.width.mas_equalTo(contentView.mas_width);
        make.height.mas_equalTo(15 + 20 + 45);
    }];
    
    UIImageView *line1 = [[UIImageView alloc] init];
    line1.image = [UIImage imageTintColorWithName:@"third_line_l" superView:line1];
    [self.thirdView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thirdView.mas_left);
        make.top.equalTo(self.thirdView).offset(5);
        make.width.mas_equalTo(self.thirdView.mas_width).multipliedBy(0.33);
        make.height.mas_equalTo(6);
    }];
    
    UILabel *thirdLabel = [[UILabel alloc] init];
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    thirdLabel.backgroundColor = KWhite_Color;
    thirdLabel.textColor = KGray_Color;
    thirdLabel.text = @"第三方登录";
    thirdLabel.font = KFont(16);
    [self.thirdView addSubview:thirdLabel];
    [thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line1.mas_right);
        make.top.equalTo(self.thirdView.mas_top);
        make.width.mas_equalTo(line1.mas_width);
        make.height.mas_equalTo(15);
    }];
    
    UIImageView *line2 = [[UIImageView alloc] init];
    line2.image = [UIImage imageTintColorWithName:@"third_line_r" superView:line2];
    [self.thirdView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdLabel.mas_right);
        make.top.equalTo(line1);
        make.width.mas_equalTo(line1.mas_width);
        make.height.mas_equalTo(6);
    }];
    
    [self.thirdView addSubview:self.wechatBtn];
    [self.thirdView addSubview:self.qqBtn];
    
    if (isQQ && isWx) {
        [self.wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line1.mas_right).offset(-30);
            make.top.equalTo(thirdLabel.mas_bottom).offset(20);
            make.width.height.mas_equalTo(40);
        }];
        
        
        [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line2.mas_left).offset(-10);
            make.top.equalTo(self.wechatBtn);
            make.size.equalTo(self.wechatBtn);
        }];
    } else if (isQQ){
        
        [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.left.equalTo(line2.mas_left).offset(-10);
            make.centerX.equalTo(self.thirdView);
            make.top.equalTo(thirdLabel.mas_bottom).offset(20);
            make.width.height.mas_equalTo(40);
        }];
    } else if (isWx){
        [self.wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.thirdView);
            make.top.equalTo(thirdLabel.mas_bottom).offset(20);
            make.width.height.mas_equalTo(40);
        }];
    } else {
        [self.thirdView setHidden:YES];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (CGRectGetMaxY(self.thirdView.frame) + 50 > self.frame.size.height) {
        self.contentSize = CGSizeMake(KScreenWidth, CGRectGetMaxY(self.thirdView.frame) + 50);
    } else {
        self.contentSize = CGSizeMake(KScreenWidth, self.frame.size.height + 50);
    }
}


-(DZTextField *)nameView{
    if (!_nameView) {
        _nameView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_u")];
        _nameView.inputField.tag = 101;
        _nameView.inputField.placeholder = @"账号";
    }
    return _nameView;
}

-(DZTextField *)pwordView{
    if (!_pwordView) {
        _pwordView = [[DZTextField alloc] initWithLeft:KImageNamed(@"log_p")];
        _pwordView.inputField.tag = 102;
        _pwordView.inputField.placeholder = @"密码";
        _pwordView.inputField.secureTextEntry = YES;
    }
    return _pwordView;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.cs_acceptEventInterval = 1;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 5.0;
        _loginBtn.backgroundColor = KGreen_Color;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    }
    return _loginBtn;
}

-(UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    }
    return _forgetBtn;
}

-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _qqBtn.cs_acceptEventInterval = 1;
        [_qqBtn setBackgroundImage:[UIImage imageTintColorWithName:@"third_q" superView:self.qqBtn] forState:UIControlStateNormal];
    }
    return _qqBtn;
}

-(UIView *)thirdView{
    if (!_thirdView) {
        _thirdView = [[UIView alloc] init];
        _thirdView.backgroundColor = KWhite_Color;
    }
    return _thirdView;
}

-(UIButton *)wechatBtn{
    if (!_wechatBtn) {
        _wechatBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _wechatBtn.cs_acceptEventInterval = 1;
        [_wechatBtn setBackgroundImage:[UIImage imageTintColorWithName:@"third_w" superView:self.wechatBtn] forState:UIControlStateNormal];
    }
    return _wechatBtn;
}

- (UILabel *)thridAuthTipLabl {
    if (!_thridAuthTipLabl) {
        _thridAuthTipLabl = [[UILabel alloc] init];
        _thridAuthTipLabl.numberOfLines = 0;
    }
    return _thridAuthTipLabl;
}


@end




