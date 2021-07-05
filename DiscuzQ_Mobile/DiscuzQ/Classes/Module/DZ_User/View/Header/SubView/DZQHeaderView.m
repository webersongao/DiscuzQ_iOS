//
//  DZQHeaderView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQHeaderView.h"
#import <UIButton+WebCache.h>


@interface DZQHeaderView ()

@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *groupLabel;
@property(nonatomic,strong) UIButton *rightSkipButton;
@property(nonatomic,strong) UILabel *signatureLabel;

@end

@implementation DZQHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.avatarView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.groupLabel];
//        [self addSubview:self.signatureLabel];
        [self addSubview:self.rightSkipButton];
    }
    return self;
}

-(void)updateHeader:(DZQUserV1 *)userModel group:(DZQGroupV1 *)group{
    
    self.groupLabel.text = group.name;
    self.signatureLabel.text = userModel.signature;
    self.nameLabel.text = userModel.username ?: @"未登录";
    [self.avatarView dz_setBackImageWithURL:userModel.avatarUrl forState:UIControlStateNormal placeholder:KImageNamed(DZQ_icon)];
    [self layoutMyHeaderSubviews];
}



-(void)layoutMyHeaderSubviews{
    if (self.groupLabel.text.length) {
        self.nameLabel.top = self.avatarView.top + 10.0;
    }else{
        self.nameLabel.centerY = self.avatarView.centerY;
    }
    self.groupLabel.top = self.nameLabel.bottom + kMargin5;
}

-(UIButton *)avatarView{
    if (!_avatarView) {
        _avatarView = [UIButton ButtonNormalWithFrame:CGRectMake(kMargin15, (self.height-60)/2.0, 60, 60) title:nil titleFont:nil titleColor:nil normalImgPath:DZQ_Square_icon touchImgPath:DZQ_Square_icon isBackImage:YES picAlpha:1];
        _avatarView.layer.cornerRadius = 10.f;
        _avatarView.layer.masksToBounds = YES;
    }
    return _avatarView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectMake(self.avatarView.right + kMargin10, self.avatarView.top+kMargin10, self.width/2.f, 24) title:@"未登录" titleColor:KBlack_Color font:KBoldFont(23.f) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}


-(UILabel *)groupLabel{
    if (!_groupLabel) {
        _groupLabel = [UILabel labelWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom + kMargin5, self.nameLabel.width, 14) title:@"" titleColor:KGray_Color font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _groupLabel;
}

-(UILabel *)signatureLabel{
    if (!_signatureLabel) {
        _signatureLabel = [UILabel labelWithFrame:CGRectMake(self.avatarView.left, self.avatarView.bottom + kMargin5, self.width-kMargin30, 14) title:@"" titleColor:KLightContent_Color font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _signatureLabel;
}

-(UIButton *)rightSkipButton{
    if (!_rightSkipButton) {
        _rightSkipButton = [UIButton ButtonTextWithFrame:CGRectMake(self.right - kMargin15 - 45, (self.height - 35)/2.f, 45, 32.f) titleStr:@" →_→" titleColor:KTitle_Color titleTouColor:KTitle_Color font:KBoldFont(16) Radius:4.f Target:self action:nil];
        _rightSkipButton.userInteractionEnabled = NO;
        _rightSkipButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _rightSkipButton;
}


@end
