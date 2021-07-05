//
//  DZBaseNavigationController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseNavigationController.h"
#import "DZBaseViewController.h"

@interface DZBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation DZBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.popGestureEnabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.hidden = YES;
    self.view.backgroundColor = KWhite_Color;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.topViewController preferredStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden{
    return [self.topViewController prefersStatusBarHidden];
}

-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    dispatch_async(dispatch_get_main_queue(), ^{
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    });
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[DZBaseViewController class]]) {
        DZBaseViewController *vc = (DZBaseViewController *)viewController;
        if (vc.DZ_hideTabBarWhenPushed) {
            vc.hidesBottomBarWhenPushed = YES;
        }
        
        if (vc.systemNavBarHidden) {
            [super pushViewController:viewController animated:animated];
            return;
        }
    }
    
    if (self.viewControllers.count > 0) {
        if ([viewController isKindOfClass:[DZBaseNaviBarController class]]) {
            DZBaseNaviBarController *baseCtrl = (DZBaseNaviBarController *)viewController;
            if ([baseCtrl respondsToSelector:@selector(leftBarBtnClick:)]) {
                [baseCtrl dz_SetNavigationBackItemWithTarget:baseCtrl action:@selector(leftBarBtnClick:)];
            }
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark -
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.popGestureEnabled) {
        return NO;
    }
    
    DZBaseViewController *vc = (DZBaseViewController *)self.topViewController;
    if ([vc isKindOfClass:[DZBaseViewController class]]) {
        return vc.popGestureEnabled;
    }
    
    return self.popGestureEnabled;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [self gestureRecognizerShouldBegin:gestureRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}




@end
