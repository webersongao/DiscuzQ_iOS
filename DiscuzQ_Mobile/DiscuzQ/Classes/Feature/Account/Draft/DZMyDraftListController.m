//
//  DZMyDraftListController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyDraftListController.h"

@interface DZMyDraftListController ()

@end

@implementation DZMyDraftListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"草稿箱";
    
    [self.view dz_showEmptyView];
}



@end
