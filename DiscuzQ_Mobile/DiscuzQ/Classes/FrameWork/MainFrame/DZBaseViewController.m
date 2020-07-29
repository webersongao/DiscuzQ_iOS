//
//  DZBaseViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/4.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "WBEmoticonInputView.h"

@interface DZBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DZBaseViewController

-(BOOL)DZ_hideTabBarWhenPushed{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateSystemNavBarHiddenWhenViewWillAppear];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self configBaseViewController];
}

-(void)configBaseViewController{
    
    [self.view setExclusiveTouch:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transToLogin) name:DZ_UserLogin_Notify object:nil];
    // 监听UIWindow隐藏 播放视频的时候，状态栏会自动消失，处理后让状态栏重新出现
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endFullScreen:) name:UIWindowDidBecomeHiddenNotification object:nil];
}

#pragma mark - system NavBar
- (BOOL)autoSettingSystemNavBarHidden {
    return YES;
}

- (BOOL)systemNavBarHidden {
    return NO;
}

- (BOOL)popGestureEnabled {
    return YES;
}

// 弹出登录界面
- (void)transToLogin {
    [[DZMobileCtrl sharedCtrl] PresentLoginController];
}

// 界面是否登录
- (BOOL)isLogin {
    if (![DZLoginModule isLogged]) {
        [self transToLogin];
        return NO;
    }
    return YES;
}

#pragma mark -
- (void)updateSystemNavBarHiddenWhenViewWillAppear {
    if (!self.autoSettingSystemNavBarHidden) {
        return;
    }
    
    if (self.dz_HideNaviBar != self.systemNavBarHidden) {
        self.dz_HideNaviBar = self.systemNavBarHidden;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }else{
        return YES;
    }
}

- (void)showServerError:(NSError *)error {
    if (error != nil) {
        NSString *message = [NSString stringWithFormat:@"错误:%@",[error localizedDescription]];
#ifdef DEBUG
        KSLog(@"WBS 出现错误 %s 提示：%@",__FUNCTION__,message);
#else
        if (error.code == NSURLErrorTimedOut) {
            message = @"网络请求超时！";
        } else {
            message = @"服务器数据获取失败";
        }
#endif
        [MBProgressHUD showInfo:message];
    }
}


-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    });
}
/**
 * 创建左右 导航按钮
 @param titleOrImg  标题或者图片路径
 @param type  类型 图片 或者 title
 @param direction  方向 左右
 */
-(void)configNaviBar:(NSString *)titleOrImg type:(NaviItemType)type Direction:(NaviDirection)direction {
    
    if (direction == NaviDirectionLeft) {
        UIBarButtonItem *leftBtn;
        if (type == NaviItemText) {
            leftBtn = [[UIBarButtonItem alloc] initWithItemTitle:titleOrImg Layout:YES target:self action:@selector(leftBarBtnClick:)];
        } else {
            leftBtn = [[UIBarButtonItem alloc] initWithItemImageName:titleOrImg target:self action:@selector(leftBarBtnClick:)];
        }
        [self dz_SetItem:leftBtn Layout:YES];
    } else {
        UIBarButtonItem *rightBtn;
        if (type == NaviItemText) {
            rightBtn = [[UIBarButtonItem alloc] initWithItemTitle:titleOrImg Layout:YES target:self action:@selector(rightBarBtnClick:)];
        } else {
            rightBtn = [[UIBarButtonItem alloc] initWithItemImageName:titleOrImg target:self action:@selector(rightBarBtnClick:)];
        }
        [self dz_SetItem:rightBtn Layout:NO];
    }
}

-(void)leftBarBtnClick:(UIButton *)button {
    if (self.navigationController.viewControllers.count > 1) {
        [WBEmoticonInputView sharedView].hidden = YES;
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rightBarBtnClick:(UIButton *)button{
    KSLog(@"you按钮");
}

#pragma mark - 懒加载
// 加载圈
- (MBProgressHUD *)HUD {
    if (!_HUD) {
        _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    return _HUD;
}

- (CGFloat)tabbarHeight {
    if (!_tabbarHeight) {
        CGRect rectOfTabbar = self.tabBarController.tabBar.frame;
        _tabbarHeight = CGRectGetHeight(rectOfTabbar);
    }
    return _tabbarHeight;
}

- (CGFloat)statusbarHeight {
    if (!_statusbarHeight) {
        CGRect rectOfStatusbar = [[UIApplication sharedApplication] statusBarFrame];
        _statusbarHeight = CGRectGetHeight(rectOfStatusbar);
    }
    return _statusbarHeight;
}

- (void)endFullScreen:(NSNotification *)noti {
    UIWindow * window = (UIWindow *)noti.object;
    if(window && [window isKindOfClass:[UIWindow class]]){
        UIViewController *rootVC = window.rootViewController.childViewControllers.firstObject;
        if([rootVC isKindOfClass:NSClassFromString(@"AVPlayerViewController")]){
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
        }
    }
}




@end
