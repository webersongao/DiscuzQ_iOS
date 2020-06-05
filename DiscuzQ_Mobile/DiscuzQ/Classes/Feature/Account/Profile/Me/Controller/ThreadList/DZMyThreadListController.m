//
//  MyTopicViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZMyThreadListController.h"

@interface DZMyThreadListController ()

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, assign) NSInteger page;  //!< 属性注释

@end

@implementation DZMyThreadListController

- (instancetype)initWithUserid:(NSString *)user_id
{
    self = [super init];
    if (self) {
        self.user_id = user_id;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的主题";
    
    [self downLoadMyThreadListData];
    [self.view addSubview:self.listView];
    
    KWEAKSELF;
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreMyThreadData];
    }];
}

- (void)loadMoreMyThreadData {
    self.page ++;
    [self downLoadMyThreadListData];
}

-(void)downLoadMyThreadListData {
//    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
    
}



-(DZMyThreadListView *)listView{
    if (!_listView) {
        _listView = [[DZMyThreadListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _listView;
}

@end
