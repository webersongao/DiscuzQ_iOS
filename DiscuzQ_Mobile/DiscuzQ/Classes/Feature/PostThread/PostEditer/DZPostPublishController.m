//
//  DZPostPublishController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostPublishController.h"
#import "DZLocalPostEditerView.h"

@interface DZPostPublishController ()

@property (nonatomic, strong) DZLocalPostEditerView *editerView;  //!< 属性注释

@end

@implementation DZPostPublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"sdgajghjakdghkajhk";
    [self configNaviBar:@"发布" type:NaviItemText Direction:NaviDirectionRight];
    // Do any additional setup after loading the view.
}

-(DZLocalPostEditerView *)editerView{
    if (!_editerView) {
        CGRect editRect = CGRectMake(0, KNavi_ContainStatusBar_Height, self.view.width, KView_OutNavi_Bounds.size.height - KTabbar_Gap);
        _editerView = [[DZLocalPostEditerView alloc] initWithFrame:editRect];
    }
    return _editerView;
}


@end
