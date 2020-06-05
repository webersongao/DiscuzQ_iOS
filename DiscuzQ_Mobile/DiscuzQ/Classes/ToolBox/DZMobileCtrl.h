//
//  DZMobileCtrl.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DZRootTabBarController.h"
#import "DZBaseNavigationController.h"
#import "GlobalModel.h"
#import "DZShadowView.h"
#import "DZInstance.h"
#import "DZUserModel.h"

@interface DZMobileCtrl : NSObject

+(instancetype)sharedCtrl;

@property (nonatomic, strong) DZUserModel *User;  //!< 用户信息(包含Token)

@property (nonatomic, strong) DZInstance *instance;  //!< 存放各种单例属性
@property (nonatomic, strong) DZShadowView *shadowAlertView;  //!< 阴影View
@property(nonatomic,strong,readonly) DZRootTabBarController *rootTababar;
@property(nonatomic,strong,readonly) DZBaseNavigationController *mainNavi;

+ (BOOL)IsEnableWifi;

//网络是否联通，不仅仅wifi
+ (BOOL)connectedNetwork;

/// 设置tabbar 和 mainNavi
-(void)setTababar:(UITabBarController *)Tababar mainNavi:(UINavigationController *)mainNavi;

- (void)showServerAlertError:(NSError *)error;

@end


