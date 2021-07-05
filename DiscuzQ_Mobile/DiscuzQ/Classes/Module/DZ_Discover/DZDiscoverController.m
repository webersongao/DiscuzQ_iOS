//
//  DZDiscoverController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDiscoverController.h"
#import "DZDiscoveView.h"

@interface DZDiscoverController ()

@property (nonatomic, strong) DZDiscoveView *mainView;  //!< <#属性注释#>

@end

@implementation DZDiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广场";
    [self.view addSubview:self.mainView];
}

-(BOOL)DZ_hideTabBarWhenPushed{
    return NO;
}

-(DZDiscoveView *)mainView{
    if (!_mainView) {
        _mainView = [[DZDiscoveView alloc] initWithFrame:KView_OutNaviTab_Bounds];
    }
    return _mainView;
}








@end
