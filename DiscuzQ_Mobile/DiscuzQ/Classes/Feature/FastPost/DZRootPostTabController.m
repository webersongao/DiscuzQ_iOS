//
//  DZRootPostTabController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootPostTabController.h"

@interface DZRootPostTabController ()

@end

@implementation DZRootPostTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_PostTabController];
}


-(void)config_PostTabController{
    
    [self configNaviBar:@"发布" type:NaviItemText Direction:NaviDirectionRight];
}


-(void)rightBarBtnClick{
    
    KSLog(@"WBS 提交 主题信息");
}





@end
