//
//  DZBaseNaviBarController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DZNavigationBar.h"

typedef NS_ENUM(NSInteger, DZNaviItemType) {
    DZNaviItemType_None,
    DZNaviItemType_Text,//文本
    DZNaviItemType_Image//图片
};

@interface DZBaseNaviBarController : UIViewController

/** 控制共用的NavigationBar 可直接Hidden隐藏 */
@property(nonatomic,strong) DZNavigationBar *dz_NavigationBar;
/** NavigationBar 上的 NavigationItem 导航条目 接收左右的item */
@property(nonatomic,strong) UINavigationItem *dz_NavigationItem;

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

/** 是否覆盖vc的title默认是NO,使用自定义title */
@property(nonatomic,assign) BOOL dz_HideTitle;


/// 将导航条置于顶层
-(void)dz_bringNavigationBarToFront;

/**
 设置Item
 
 @param infoStr 图片名/文本
 @param type 图片/文本
 @param isLeft 是左/右 左=YES
 @param isFix 是否需要弹簧
 @param target 代理
 @param action 点击事件
 */
- (void)dz_SetNavigationItemWithInfoString:(NSString *)infoStr Type:(DZNaviItemType)type Layout:(BOOL)isLeft FixSpace:(BOOL)isFix target:(id)target action:(SEL)action;

/**
 设置返回item
 
 @param target 代理
 @param action 事件
 */
- (void)dz_SetNavigationBackItemWithTarget:(id)target action:(SEL)action;

/**
 设置右上角文本item
 
 @param infoStr 文本
 @param target 代理
 @param action 事件
 */
- (void)dz_SetNavigationRightTextItemWithInfoString:(NSString *)infoStr target:(id)target action:(SEL)action;

/**
 设置item
 @param item 单个item
 @param isLeft 是否是左边
 */
- (void)dz_SetItem:(UIBarButtonItem *)item Layout:(BOOL)isLeft;

/**
 设置items
 @param items items
 @param isLeft 是否是左边
 */
- (void)dz_SetItems:(NSArray *)items Layout:(BOOL)isLeft;

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
 取消滚动视图的缩进
 
 @param tableview 滚动视图
 */
- (void)dz_CancelScrollViewInsetWithTableView:(UITableView *)tableview;

/**
 将子View 放在Bar之下还是之上
 
 @param view 子view
 @param isBelow BOOL
 */
- (void)dz_AddSubView:(UIView *)view belowNavigationBar:(BOOL)isBelow;

/**
 点击返回按钮 子类可以通过拦截这个方法拦截返回事件
 */
-(void)leftBarBtnClick;


- (BOOL)isPresent;


-(void)dz_PopCurrentViewController;








@end


