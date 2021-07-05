//
//  DZAppLoadingView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZAppLoadingView.h"
#import "DZShadowView.h"

@interface DZAppLoadingView ()

@end

@implementation DZAppLoadingView

// 批量操作  状态浮层
+ (void)showStateWithTitle:(NSString *)StateTitle cancelTitle:(NSString *)cancelTitle Target:(id)target cancelAction:(SEL)cancelAction{
    
    UIView *infoView = [[UIView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height - KCenterBarHeight, KScreenWidth, KCenterBarHeight)];
    infoView.backgroundColor = KWhite_Color;
    
    UIImageView *actImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PRState_Loading_1"]];
    actImageView.frame = CGRectMake(kMargin20, (KCenterBarHeight - kMargin20)/2.0, kMargin20,kMargin20);
    NSMutableArray *imageArr = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0 ; i< 8; i++) {
        UIImage *imageV = [UIImage imageNamed:[NSString stringWithFormat:@"PRState_Loading_%d",i+1]];
        if (imageV) {
            [imageArr addObject:imageV];
        }
    }
    actImageView.animationDuration = 2.0;
    actImageView.animationImages = imageArr;
    [actImageView startAnimating];
    
    // 文字
    UILabel *stateLab = [[UILabel alloc] initWithFrame:CGRectMake(actImageView.right + 10, (KCenterBarHeight - 16)/2.0, KScreenWidth - 120, 16)];
    stateLab.text = StateTitle;
    stateLab.font = [UIFont systemFontOfSize:15.0];
    stateLab.textColor = KTitle_Color;
    stateLab.textAlignment = NSTextAlignmentLeft;
    stateLab.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    // 取消按钮
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - kMargin20 - 50,(KCenterBarHeight - 30)/2.0, 50, 30)];
    NSString *canStr = cancelTitle.length ? cancelTitle : @"取消";
    [cancelBtn setTitle:canStr forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [cancelBtn setTitleColor:KDarkGreen_Color forState:UIControlStateNormal];
    cancelBtn.layer.borderColor = KDarkGreen_Color.CGColor;
    cancelBtn.layer.borderWidth = 1.0;
    cancelBtn.layer.cornerRadius = 3.0;
    if (target && cancelAction) {
        [cancelBtn addTarget:target action:cancelAction forControlEvents:UIControlEventTouchUpInside];
    }
    
    [infoView addSubview:actImageView];
    [infoView addSubview:stateLab];
    [infoView addSubview:cancelBtn];
    
    DZShadowView * AlertView = [[DZShadowView alloc] initWithFrame:KScreenBounds backgroundColor:nil animationType:ShadowAlertAnimationOutDefine bGUIShadowView:YES];
    AlertView.bCloseByTap = NO;
    [AlertView setTheTopView:infoView];
    
    [AlertView showShadowAlertViewToKeyWindow];
}

// 隐藏  状态浮层
+ (void)hiddenStateLoadingView{
    [[DZMobileCtrl sharedCtrl].shadowAlertView closeAlertView];
}





@end












