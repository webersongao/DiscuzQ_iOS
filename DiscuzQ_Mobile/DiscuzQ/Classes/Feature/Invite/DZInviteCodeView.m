//
//  DZInviteCodeView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZInviteCodeView.h"

@interface DZInviteCodeView ()

@property (nonatomic, copy) NSString *codeStr;  //!< 属性注释
@property (nonatomic, strong) DZQBaseUser *userModel;  //!< 属性注释

@property(nonatomic,strong) UIImageView *localIconView;  // 属性注释
@property(nonatomic,strong) UILabel *localDescLabel;  // 属性注释
@property(nonatomic,strong) UILabel *localCodeLabel;  // 属性注释
@property(nonatomic,strong) UIButton *localCopyButton;  // 复制按钮

@end

@implementation DZInviteCodeView


- (instancetype)initWithCode:(NSString *)code user:(DZQBaseUser *)userModel
{
    self = [super initWithFrame:CGRectMake((KScreenWidth-300)/2.0,KScreenHeight-220-100, 300, 220)];
    if (self) {
        self.codeStr = checkNull(code);
        self.userModel = userModel;
        [self config_localInviteCodeView];
        self.backgroundColor = KDebug_Color;
    }
    return self.codeStr.length ? self : nil;
}


-(void)config_localInviteCodeView{
    
    self.layer.cornerRadius = 8.f;
    self.layer.masksToBounds = YES;
    [self addSubview:self.localIconView];
    [self addSubview:self.localDescLabel];
    [self addSubview:self.localCodeLabel];
    [self addSubview:self.localCopyButton];
    
    [self.localIconView dz_setImageWithURL:self.userModel.avatarUrl placeholder:KImageNamed(DZQ_icon)];
    
}


-(void)localCopyButtonAction:(UIButton *)button{
    
    [DZMobileCtrl PasteLocalBoardWithString:self.codeStr];
    [[DZShadowAlertManager sharedManager] dismissScaleAlertView];
    
}


- (UIImageView *)localIconView{
    if (!_localIconView) {
        _localIconView =[[UIImageView alloc] initWithFrame:CGRectMake((self.width-kCellHeight_50)/2.0, kMargin15, kCellHeight_50, kCellHeight_50)];
        _localIconView.layer.cornerRadius = 25.f;
        _localIconView.layer.masksToBounds = YES;
    }
    return _localIconView;
}

-(UILabel *)localDescLabel{
    if (!_localDescLabel) {
        _localDescLabel = [UILabel labelWithFrame:CGRectMake(kMargin20, self.localIconView.bottom+kMargin20, self.width-kMargin40, 10) title:@"复制以下邀请码，邀请更多好友~" titleColor:KLightContent_Color font:KFont(10) textAlignment:NSTextAlignmentCenter];
    }
    return _localDescLabel;
}

-(UILabel *)localCodeLabel{
    if (!_localCodeLabel) {
        _localCodeLabel = [UILabel labelWithFrame:CGRectMake(kMargin20, self.localDescLabel.bottom+kMargin15, self.width-kMargin40, 45) title:self.codeStr titleColor:KTitle_Color font:KBoldFont(18) textAlignment:NSTextAlignmentCenter];
        _localCodeLabel.numberOfLines = 2;
        _localCodeLabel.layer.cornerRadius = 5.f;
        _localCodeLabel.layer.masksToBounds = YES;
        _localCodeLabel.backgroundColor = KLine_Color;
    }
    return _localCodeLabel;
}


-(UIButton *)localCopyButton{
    if (!_localCopyButton) {
        _localCopyButton = [UIButton ButtonTextWithFrame:CGRectMake((self.width-80)/2.0, self.height-kMargin45, 80, 30) titleStr:@"一键复制" titleColor:KWhite_Color titleTouColor:KLightContent_Color font:KFont(14) Radius:5 Target:self action:@selector(localCopyButtonAction:)];
        _localCopyButton.backgroundColor = KGreen_Color;
    }
    return _localCopyButton;
}


@end
