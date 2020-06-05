//
//  DZVideoScanListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/14.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZVideoScanListController.h"

@interface DZVideoScanListController ()

@end

@implementation DZVideoScanListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.homeMainView];
}



-(DZHomeListScanView *)homeMainView{
    if (_homeMainView == nil) {
        _homeMainView = [[DZHomeListScanView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth, KScreenHeight    - KNavi_ContainStatusBar_Height)];
        _homeMainView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height + kHomeHeaderHeight);
    }
    return _homeMainView;
}

@end
