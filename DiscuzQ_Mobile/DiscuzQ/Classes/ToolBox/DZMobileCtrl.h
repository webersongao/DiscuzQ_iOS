//
//  DZMobileCtrl.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DZRootTabBarController.h"
#import "DZBaseNavigationController.h"
#import "DZShadowView.h"
#import "DZInstance.h"
#import "DZMoreMenu.h"
#import "DZUserM.h"
#import "DZLoadingView.h"

@interface DZMobileCtrl : NSObject

+(instancetype)sharedCtrl;

@property (nonatomic, strong, readonly) DZUserM *User;  //!< 用户信息(包含Token)
@property (nonatomic, strong, readonly) NiHubView *hubView;
@property (nonatomic, strong, readonly) DZInstance *instance;  //!< 存放各种单例属性
@property (nonatomic, strong, readonly) DZMoreMenu *moreMenu;  //!< 属性注释
@property (nonatomic, strong, readonly) NSMutableArray* tipHubViewArr;
@property (nonatomic, strong) DZShadowView *shadowAlertView;  //!< 阴影View

@property (nonatomic, assign, readonly) BOOL bOpenLoadAnimated;
@property (nonatomic, strong, readonly) DZRootTabBarController *rootTababar;
@property (nonatomic, strong, readonly) DZBaseNavigationController *mainNavi;

// 界面是否登录
- (BOOL)isLogin;

// 弹出登录界面
- (void)transToLogin;

+ (BOOL)isWiFiEnable;

//网络是否联通，不仅仅wifi
+ (BOOL)connectedNetwork;

+(NSString *)siteRootDomain;

/// 设置tabbar 和 mainNavi
-(void)setTababar:(UITabBarController *)Tababar mainNavi:(UINavigationController *)mainNavi;

- (void)showServerAlertError:(NSError *)error;


-(void)updateRootUser:(DZUserM *)userModel;
-(void)updateRootHub:(NiHubView *)hubView;


@end


