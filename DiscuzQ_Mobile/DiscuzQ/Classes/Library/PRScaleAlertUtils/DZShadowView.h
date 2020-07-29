//
//  DZShadowView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ShadowAlertAnimationType) {
    
    ShadowAlertAnimationNone,//没用动画
    ShadowAlertAnimationOutDefine,//模糊自定义动画
    ShadowAlertAnimationFromUp,//从上到下的动画
    ShadowAlertAnimationFromDown, //从下到上的动画
    ShadowAlertAnimationFromRight, //从右到左出来
};


@interface DZShadowView : UIView
{
	UIView* m_topView;
    BOOL m_bCloseWhenRotate;//转屏是否自动关闭
    BOOL m_bCloseByTap;//点击是否自动关闭
    BOOL m_bPRCustomAlertView;
    BOOL m_bBottom;
}

@property(nonatomic, strong)UIView* topView;
@property(nonatomic, assign)BOOL bCloseWhenRotate;
@property(nonatomic, assign)BOOL bCloseByTap;
@property(nonatomic, assign)BOOL bPRCustomAlertView;
@property(nonatomic, assign)BOOL bBottom;

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertAnimationType)animationType;

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertAnimationType)animationType bGUIShadowView:(BOOL)bGUIShadow;

- (void)onlySetTheTopView:(UIView*)view;
- (void)setTheTopView:(UIView*)view;
- (void)setTheTopView:(UIView*)view supportOrientation:(BOOL)support;
- (void)orientationPosition;
- (void)closeAlertView;

- (void)closeAlertViewWithAnimated;
- (void)showShadowAlertViewToKeyWindow;

@end
