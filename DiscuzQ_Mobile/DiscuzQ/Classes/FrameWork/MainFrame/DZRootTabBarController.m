//
//  DZRootTabBarController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/7/12.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZRootTabBarController.h"
#import "DZBaseNavigationController.h"
#import "DZMsgNotiViewController.h"
#import "DZRootPublishController.h"
#import "DZHomeViewController.h"
#import "DZDiscoverController.h"
#import "DZRootTabBar.h"
#import "DZMediaViewController.h"
#import "DZUserViewController.h"

#import "DZHomeTestViewController.h"

@interface DZRootTabBarController () <UITabBarControllerDelegate>
@property (nonatomic, assign) NSInteger oldSelected;
@property (nonatomic, assign) NSInteger notitySelected;
@end

@implementation DZRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [[DZMobileCtrl sharedCtrl] cofigLocalDataInfo];
    
    self.selectedIndex = 0;
    [self addChildViewControllers];
    [self setValue:[[DZRootTabBar alloc] init] forKeyPath:@"tabBar"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ttsetSelectInex:) name:DZ_ConfigSelectedIndex_Notify object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self tabBarController:self didSelectViewController:self.selectedViewController];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[DZMobileCtrl sharedCtrl] setTababar:self mainNavi:self.selectedViewController];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        [[DZMobileCtrl sharedCtrl] setTababar:self mainNavi:self.selectedViewController];
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (self.oldSelected == viewController.tabBarItem.tag) { // 双击刷新
        if (viewController.tabBarItem.tag == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:DZ_TabbarRefresh_Notify object:nil];
        }
    }
    self.oldSelected = viewController.tabBarItem.tag;
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *baseNaviVC = (UINavigationController *)viewController;
        UIViewController *baseVC = baseNaviVC.topViewController;
        if ([baseVC isKindOfClass:[DZRootPublishController class]]) {
            if (![DZMobileCtrl sharedCtrl].isLogin) {
                [[DZMobileCtrl sharedCtrl] PresentLoginController];
                return NO;
            }
        }else {
            self.notitySelected = viewController.tabBarItem.tag;
        }
    }
    return YES;
}

- (void)ttsetSelectInex:(NSNotification *)notify {
    
}

- (void)addChildViewControllers {
    
    DZHomeTestViewController *testVC = [[DZHomeTestViewController alloc] initWithNibName:@"DZHomeTest" bundle:nil];
    
    DZHomeViewController *HomeVC = [[DZHomeViewController alloc] init];
    DZMediaViewController *MediaVC = [[DZMediaViewController alloc] init];
    DZDiscoverController *DisVC = [[DZDiscoverController alloc] init];
    DZMsgNotiViewController *MsgVC = [[DZMsgNotiViewController alloc] init];
    DZUserViewController *UserVC = [[DZUserViewController alloc] init];
    
//    [self addChildVc:testVC title:@"霸道总裁" image:@"tabbar_homem" selectedImage:@"tabbar_homes"];

    [self addChildVc:HomeVC title:@"首页" image:DZQ_Tab_icon selectedImage:DZQ_Tab_icon];

    [self addChildVc:DisVC title:@"广场" image:DZQ_Tab_icon selectedImage:DZQ_Tab_icon];
    
    [self addChildVc:MediaVC title:@"多媒体" image:DZQ_Tab_icon selectedImage:DZQ_Tab_icon];
    
    [self addChildVc:MsgVC title:@"消息" image:DZQ_Tab_icon selectedImage:DZQ_Tab_icon];

    [self addChildVc:UserVC title:@"我的" image:DZQ_Tab_icon selectedImage:DZQ_Tab_icon];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置子控制器的文字 设置tabbar和navigationBar的文字
    childVc.title = title;
    
    // 设置子控制器的图片
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = KTitle_Color;
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = KGreen_Color;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    DZBaseNavigationController *nav = [[DZBaseNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.tag = self.viewControllers.count;
    // 添加为子控制器
    [self addChildViewController:nav];
}

- (BOOL)shouldAutorotate {
    return NO;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationMaskPortrait;
}


@end
