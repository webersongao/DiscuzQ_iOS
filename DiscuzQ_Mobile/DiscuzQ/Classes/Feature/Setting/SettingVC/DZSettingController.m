//
//  DZSettingController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZSettingController.h"
#import "DZSettingListView.h"

@interface DZSettingController ()
@property (nonatomic,strong) NSMutableArray *listArray;  //!< 属性注释
@property (nonatomic,strong) DZSettingListView * tableView;
@end

@implementation DZSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用设置";
    [self config_SettingController];
}

-(void)config_SettingController{

    [self.view addSubview:self.tableView];
    [self.tableView updateSettingList:self.listArray.copy];
}


-(DZSettingListView *)tableView{
    if (!_tableView) {
        _tableView = [[DZSettingListView alloc] initSettingFrame:KView_OutNavi_Bounds];
    }
    return _tableView;
}

-(NSMutableArray *)listArray{
    if (_listArray == nil) {
        _listArray = [NSMutableArray array];
        NSArray *setArr = @[@"站点详情",@"切换网站",@"清除程序缓存"];
        NSArray *appArr = @[@"反馈问题",@"评价应用",@"分享该应用"];
        NSArray *aboutArr = @[@"服务条款",checkTwoStr(@"关于", DZ_APP_Name)];
        _listArray = @[setArr,appArr,aboutArr].mutableCopy;
    }
    return _listArray;
}



@end
