//
//  DZBaseNaviBarController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNavItemButton.h"
#import "DZNavigationBar.h"

@interface DZBaseNaviBarController : UIViewController

/** 控制共用的NavigationBar 可直接Hidden隐藏 */
@property(nonatomic,strong) DZNavigationBar *dz_NavigationBar;

/** 导航栏隐藏 */
@property(nonatomic,assign) BOOL dz_HideNaviBar;
/** 导航栏透明度 */
@property(nonatomic,assign) CGFloat dz_NavigationAlpha;

/** 导航条的颜色 */
@property(nonatomic,strong) UIColor *dz_BarTintColor;
/** 导航大标题的颜色 */
@property(nonatomic,strong) UIColor *dz_BarTitleTextColor;
/** 导航标题的字号 */
@property(nonatomic,strong) UIFont *dz_BarTitleFont;

/// 将导航条置于顶层
-(void)dz_bringNavigationBarToFront;

/**
 设置返回item
 
 @param target 代理
 @param action 事件
 */
- (void)dz_SetNavigationBackItemWithTarget:(id)target action:(SEL)action;

/**
 设置item
 @param item 单个item
 @param isLeft 是否是左边
 */
- (UIButton *)dz_SetNaviOneButtonItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft;


- (void)dz_SetNaviButtonItems:(NSArray<DZBarButtonItem *> *)items Layout:(BOOL)isLeft;
/**
 *设置标题视图
 
 @param titleView 自定义视图
 */
- (void)dz_SetNavigationTitleView:(UIView *)titleView;

/**
 *设置导航条Logo视图
 
 @param imagePath 本地或者网络图片
 */
- (void)dz_SetNavigationlogoView:(NSString *)imagePath;

/**
 将子View 放在Bar之下还是之上
 
 @param view 子view
 @param isBelow BOOL
 */
- (void)dz_AddSubView:(UIView *)view belowNavigationBar:(BOOL)isBelow;

/**
 点击返回按钮 子类可以通过拦截这个方法拦截返回事件
 */
-(void)leftBarBtnClick:(UIButton *)button;


- (BOOL)isPresent;


-(void)dz_PopCurrentViewController;








@end


