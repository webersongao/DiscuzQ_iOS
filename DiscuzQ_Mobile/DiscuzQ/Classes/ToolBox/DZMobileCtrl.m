//
//  DZMobileCtrl.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"
#import "PRLayouter.h"

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

-(void)setUser:(DZUserModel *)User{
    _User = User;
    [[DZQNetTool shared] updateDZQSDkToken:User.access_token];
}

-(void)MobileCtrlConfigration{
    self.moreMenu= [DZMoreMenu sharedMenu];
    self.instance = [[DZInstance alloc] init];
    self.tipHubViewArr = [NSMutableArray array];
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


+ (BOOL)IsEnableWifi{
    
    return YES;
}

//网络是否联通，不仅仅wifi
+ (BOOL)connectedNetwork{
    return YES;
}


@end
