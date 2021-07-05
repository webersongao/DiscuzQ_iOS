//
//  DZVideoScanListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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



-(DZMainCateListScanView *)homeMainView{
    if (!_homeMainView) {
        _homeMainView = [[DZMainCateListScanView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height)];
        _homeMainView.contentSize = CGSizeMake(KScreenWidth, KScreenHeight - KNavi_ContainStatusBar_Height + kHomeHeaderHeight);
    }
    return _homeMainView;
}

@end
