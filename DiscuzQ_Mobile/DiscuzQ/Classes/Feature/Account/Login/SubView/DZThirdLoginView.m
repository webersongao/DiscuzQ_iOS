//
//  DZThirdLoginView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThirdLoginView.h"

@interface DZThirdLoginView ()

@property (nonatomic, strong) UIButton *qqBtn;
@property (nonatomic, strong) UIButton *wechatBtn;

@end

@implementation DZThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhite_Color;
        [self config_thirdLoginWX:YES isQQ:YES];
    }
    return self;
}

-(void)config_thirdLoginWX:(BOOL)isWx isQQ:(BOOL)isQQ{
    
    
    UIImageView *line1 = [[UIImageView alloc] init];
    line1.image = [UIImage imageTintColorWithName:@"third_line_l" superView:line1];
    [self addSubview:line1];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self).offset(5);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.33);
        make.height.mas_equalTo(6);
    }];
    
    UILabel *thirdLabel = [[UILabel alloc] init];
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    thirdLabel.backgroundColor = KWhite_Color;
    thirdLabel.textColor = KGray_Color;
    thirdLabel.text = @"第三方登录";
    thirdLabel.font = KFont(16);
    [self addSubview:thirdLabel];
    
    [thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line1.mas_right);
        make.top.equalTo(self.mas_top);
        make.width.mas_equalTo(line1.mas_width);
        make.height.mas_equalTo(15);
    }];
    
    UIImageView *line2 = [[UIImageView alloc] init];
    line2.image = [UIImage imageTintColorWithName:@"third_line_r" superView:line2];
    [self addSubview:line2];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdLabel.mas_right);
        make.top.equalTo(line1);
        make.width.mas_equalTo(line1.mas_width);
        make.height.mas_equalTo(6);
    }];
    
    [self addSubview:self.wechatBtn];
    [self addSubview:self.qqBtn];
    
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
            make.centerX.equalTo(self);
            make.top.equalTo(thirdLabel.mas_bottom).offset(20);
            make.width.height.mas_equalTo(40);
        }];
    } else if (isWx){
        [self.wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(thirdLabel.mas_bottom).offset(20);
            make.width.height.mas_equalTo(40);
        }];
    } else {
        [self setHidden:YES];
    }
    
    
   
}


-(UIButton *)wechatBtn{
    if (!_wechatBtn) {
        _wechatBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _wechatBtn.cs_acceptEventInterval = 1;
        [_wechatBtn setBackgroundImage:[UIImage imageTintColorWithName:@"third_w" superView:self.wechatBtn] forState:UIControlStateNormal];
    }
    return _wechatBtn;
}

-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _qqBtn.cs_acceptEventInterval = 1;
        [_qqBtn setBackgroundImage:[UIImage imageTintColorWithName:@"third_q" superView:self.qqBtn] forState:UIControlStateNormal];
    }
    return _qqBtn;
}



@end
