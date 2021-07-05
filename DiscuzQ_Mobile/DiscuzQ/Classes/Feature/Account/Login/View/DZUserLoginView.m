//
//  DZUserLoginView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/10.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZUserLoginView.h"
#import "DZThirdLoginView.h"

@interface DZUserLoginView ()

@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UILabel *loginTipLabl;

@property (nonatomic, strong) DZThirdLoginView *thirdLoginView;

@end

@implementation DZUserLoginView

-(instancetype)initWithFrame:(CGRect)frame isQQ:(BOOL)isQQ isWx:(BOOL)isWx {
    if (self = [super initWithFrame:frame]) {
        [self layoutLoginViewWithQQ:isQQ isWx:isWx];
        self.thirdLoginView.hidden = YES;
    }
    return self;
}

-(void)configTarget:(id)target WxLogin:(SEL)wxLogin QQ:(SEL)QQLogin apple:(SEL)appleLogin{
    
}

- (void)layoutLoginViewWithQQ:(BOOL)isQQ isWx:(BOOL)isWx {

    self.thirdField.hidden = YES;
    [self.firstField updateTextIcon:KImageNamed(@"log_u") placeholder:@"账号"];
    [self.secendField updateTextIcon:KImageNamed(@"log_p") placeholder:@"密码"];
    [self.actionButton setTitle:@"登录" forState:UIControlStateNormal];

    self.regContentView.height = CGRectGetMaxY(self.secendField.frame);
    self.actionButton.top = self.regContentView.bottom + kMargin50;
    
    [self addSubview:self.forgetBtn];
    [self addSubview:self.loginTipLabl];
    [self addSubview:self.thirdLoginView];
    
    CGFloat maxHeight = MAX(self.height, CGRectGetMaxY(self.thirdLoginView.frame) + kToolBarHeight);
    self.contentSize = CGSizeMake(self.width, maxHeight);
    
}

- (void)findPasswordAction {
    [[DZMobileCtrl sharedCtrl] PushToResetPwdController];
}


-(UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton ButtonTextWithFrame:CGRectMake(self.actionButton.right - 80, self.actionButton.bottom + kMargin10, 80, 15) titleStr:@"忘记密码？" titleColor:[UIColor blueColor] titleTouColor:[UIColor blueColor] font:KFont(14.0) Radius:0 Target:self action:@selector(findPasswordAction)];
        _forgetBtn.titleLabel.alpha = 0.8;
    }
    return _forgetBtn;
}


- (UILabel *)loginTipLabl {
    if (!_loginTipLabl) {
        _loginTipLabl = [UILabel labelWithFrame:CGRectMake(self.actionButton.left, self.forgetBtn.bottom + kMargin5, self.actionButton.width, 15) title:@"" titleColor:KGreen_Color font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _loginTipLabl;
}



-(DZThirdLoginView *)thirdLoginView{
    if (!_thirdLoginView) {
        _thirdLoginView = [[DZThirdLoginView alloc] initWithFrame:CGRectMake(self.actionButton.left, self.loginTipLabl.bottom + kCellHeight_80, self.actionButton.width, (15+20+45))];
    }
    return _thirdLoginView;
}


@end




