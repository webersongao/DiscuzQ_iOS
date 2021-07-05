//
//  DZMobileCtrl.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"
#import "PRLayouter.h"
#import "DZSiteHelper.h"

@interface DZMobileCtrl ()

@property (nonatomic, strong) DZUserM *User;  //!< 用户信息(包含Token)
@property (nonatomic, strong) DZInstance *instance;  //!< 存放各种单例属性
@property (nonatomic, strong) DZMoreMenu *moreMenu;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray* tipHubViewArr;

@end

@implementation DZMobileCtrl

static DZMobileCtrl *instance = nil;

+(instancetype)sharedCtrl{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化布局管理器
        [PRLayouter sharedLayouter];
        [self MobileCtrlConfigration];
    }
    return self;
}

-(void)MobileCtrlConfigration{
    self.moreMenu = [DZMoreMenu sharedMenu];
    self.instance = [[DZInstance alloc] init];
    self.tipHubViewArr = [NSMutableArray array];
    self.User = [DZDataContext shared].GetLocalUser;
}


// 界面是否登录
- (BOOL)isLogin {
    return self.User.isUserLogin;
}

// 弹出登录界面
- (void)transToLogin {
    [[DZMobileCtrl sharedCtrl] PresentLoginController];
}

-(void)setUser:(DZUserM *)User{
    _User = User;
    [[DZNetCenter center] updateNetSDkToken:User.tokenModel];
}

-(void)setTababar:(UITabBarController *)Tababar mainNavi:(UINavigationController *)mainNavi{
    if ([Tababar isKindOfClass:[DZRootTabBarController class]]) {
        _rootTababar = (DZRootTabBarController *)Tababar;
    }
    if ([mainNavi isKindOfClass:[DZBaseNavigationController class]]) {
        _mainNavi = (DZBaseNavigationController *)mainNavi;
    }
}

- (void)showServerAlertError:(NSError *)error {
    
}

+(NSString *)siteRootDomain{
    return [DZSiteHelper shared].siteUrlString;
}

+ (BOOL)isWiFiEnable{
    
    return YES;
}

//网络是否联通，不仅仅wifi
+ (BOOL)connectedNetwork{
    return YES;
}

-(void)updateRootUser:(DZUserM *)userModel{
    _User = userModel;
    if (!userModel) {
        [[DZDataContext shared] removeLocalUserData];
    }else{
        [[DZDataContext shared] updateLocalUser:userModel];
    }
}


-(void)updateRootHub:(NiHubView *)hubView{
    _hubView = hubView;
}


@end
