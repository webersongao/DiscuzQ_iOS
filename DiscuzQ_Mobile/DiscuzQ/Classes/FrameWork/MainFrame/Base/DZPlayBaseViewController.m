//
//  DZPlayBaseViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/8.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPlayBaseViewController.h"

@interface DZPlayBaseViewController ()

@end

@implementation DZPlayBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


/// 视频播放屏幕旋转相关基础配置

- (BOOL)shouldAutorotate {
    return [DZMediaCenter Center].player.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([DZMediaCenter Center].player.isFullScreen && [DZMediaCenter Center].player.orientationObserver.fullScreenMode == ZFFullScreenModeLandscape) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([DZMediaCenter Center].player.isFullScreen) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return [DZMediaCenter Center].player.isStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}


@end
