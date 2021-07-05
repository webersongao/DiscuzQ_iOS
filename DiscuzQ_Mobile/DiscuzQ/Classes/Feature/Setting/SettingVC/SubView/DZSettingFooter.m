//
//  DZSettingFooter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSettingFooter.h"
#import "DZSettingHelper.h"

@interface DZSettingFooter ()

@property (nonatomic, strong) UIButton *logoutButton;  //!< <#属性注释#>

@end

@implementation DZSettingFooter


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_settingFooter];
    }
    return self;
}

-(void)config_settingFooter{
    
    [self addSubview:self.logoutButton];
    if ([DZMobileCtrl sharedCtrl].isLogin) {
        [self.logoutButton setTitle:@"-> 退出 <-" forState:UIControlStateNormal];
    }else{
        [self.logoutButton setTitle:@"-> 登录 <-" forState:UIControlStateNormal];
    }
}

-(void)localUserLogoutAction:(UIButton *)button{
    
    [[DZSettingHelper shared] localUserALoginout];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.logoutButton.center = CGPointMake(self.width/2.0, self.height/2.0);
}

-(UIButton *)logoutButton{
    if (!_logoutButton) {
        _logoutButton = [UIButton ButtonTextWithFrame:CGRectMake(100, 0, self.width-200, kToolBarHeight) titleStr:@"-> 退出 <-" titleColor:KContent_Color titleTouColor:KTitle_Color font:KBoldFont(KTitle_fontSize) Radius:5 Target:self action:@selector(localUserLogoutAction:)];
        _logoutButton.backgroundColor = KGreen_Color;
    }
    return _logoutButton;
}

@end
