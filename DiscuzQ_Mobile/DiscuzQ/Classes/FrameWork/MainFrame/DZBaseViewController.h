//
//  DZBaseViewController.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/4.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseNaviBarController.h"

typedef NS_ENUM(NSUInteger, NaviDirection) {
    NaviDirectionLeft,
    NaviDirectionRight,
};

typedef NS_ENUM(NSUInteger, NaviItemType) {
    NaviItemImage,
    NaviItemText,
};

@interface DZBaseViewController : DZBaseNaviBarController
@property (nonatomic, assign) CGFloat tabbarHeight;
@property (nonatomic, assign) CGFloat statusbarHeight;

@property (nonatomic, strong) MBProgressHUD *HUD;

@property (nonatomic, assign) BOOL DZ_hideTabBarWhenPushed;  //!< push该控制器时是否隐藏TabBar

/**
 * 创建左右 导航按钮
 @param titleOrImg  标题或者图片路径
 @param type  类型 图片 或者 文字
 @param direction  方向 right or left
*/
-(void)configNaviBar:(NSString *)titleOrImg type:(NaviItemType)type Direction:(NaviDirection)direction;

/**
 服务器返回错误提示

 @param error NSError
 */
- (void)showServerError:(NSError *)error;

/**
 弹出登录界面
 */
- (void)transToLogin;

/**
 判断是否登录，未登录弹出登录界面

 @return 是或否 YES or NO
 */
- (BOOL)isLogin;

/**
 导航栏右按钮点击事件
 */
- (void)rightBarBtnClick:(UIButton *)button;


#pragma mark - Hook
/**
 子控制器决定，是否根据 - (BOOL)systemNavBarHidden自动设置导航栏的隐藏属性
 */
- (BOOL)autoSettingSystemNavBarHidden;

/**
 子控制器决定，是否隐藏系统导航条
 */
- (BOOL)systemNavBarHidden;

/**
 是否开启左滑返回手势
 
 在TPBaseNavigationController启用该手势时才有效
 */
- (BOOL)popGestureEnabled;




@end
