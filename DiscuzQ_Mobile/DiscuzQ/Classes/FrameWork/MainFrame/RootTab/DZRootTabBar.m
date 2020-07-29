//
//  DZRootTabBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/3/7.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZRootTabBar.h"


#define TabbarItemNums  3.0    //tabbar的数量

@interface DZRootTabBar ()
{
    CGFloat badgeDotWH;
}
/** 发布按钮 */
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation DZRootTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configRootTabBarSubView];
    }
    return self;
}

-(void)configRootTabBarSubView{
    badgeDotWH = KWidthScale(6.f);
    self.translucent = NO;
    self.tintColor = KGreen_Color;
//    [self addSubview:self.publishButton];
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha= (hidden ? 0 : 1);
        } completion:^(BOOL finished) {
            [self setHidden:hidden];
        }];
    } else {
        [self setHidden:hidden];
    }
}

- (void)publishButtonClick:(UIButton *)button
{
    [[DZMobileCtrl sharedCtrl] PushToPostTabViewController];
}


// WBS 显示小红点
- (void)showBadgeOnItemIndex:(TabItemIndex)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    CGRect tabFrame = self.frame;
    UIImageView *badgeDotView = [[UIImageView alloc] initWithImage:KImageNamed(@"dz_tabbar_redDot")];
    badgeDotView.tag = 888 + index;
    
    //确定位置
    CGFloat percentX = (index + 0.55) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.16 * (tabFrame.size.height - KTabbar_Gap));
    badgeDotView.frame = CGRectMake(x, y, badgeDotWH, badgeDotWH);
    [self addSubview:badgeDotView];
}

//隐藏小红点
- (void)hideBadgeOnItemIndex:(TabItemIndex)index{
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(TabItemIndex)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    CGFloat width = self.frame.size.width;
//    CGFloat height = (KTabbar_Height - KTabbar_Gap) - 1;
    
    // 设置发布按钮的frame
//    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
//
//    // 设置其他UITabBarButton的frame
//    CGFloat buttonY = 0;
//    CGFloat buttonW = width / 5;
//    CGFloat buttonH = height;
//    NSInteger index = 0;
//    for (UIControl *button in self.subviews) {
//        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
//        // 计算按钮的x值
//        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
//        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
//
//        // 增加索引
//        index++;
//    }
}


-(UIButton *)publishButton{
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"dz_tabbar_publish"] forState:UIControlStateNormal];
        [_publishButton setImage:[UIImage imageNamed:@"dz_tabbar_publish_h"] forState:UIControlStateHighlighted];
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"dz_tabbar_publish_back"] forState:UIControlStateNormal];
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"dz_tabbar_publish_back_h"] forState:UIControlStateHighlighted];
        [_publishButton addTarget:self action:@selector(publishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _publishButton.frame = CGRectMake(0, 0, 80, (KTabbar_Height - KTabbar_Gap) - 1);
    }
    return _publishButton;
}



@end
