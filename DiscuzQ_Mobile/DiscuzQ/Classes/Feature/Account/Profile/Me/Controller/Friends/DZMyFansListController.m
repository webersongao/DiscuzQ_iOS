//
//  DZMyFansListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyFansListController.h"

@interface DZMyFansListController ()

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray<DZQDataFollow *> *threadArray;  //!< 属性注释

@end

@implementation DZMyFansListController

- (instancetype)initWithUserid:(NSString *)user_id
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.user_id = checkNull(user_id);
    }
    return self.user_id.length ? self : nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"粉丝列表";
    [self.view addSubview:self.listView];
    [self configUserFollowListCtrlAction];
    self.view.backgroundColor = KDebug_Color;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self first_LoadUserFollowListViewData];
}


-(void)configUserFollowListCtrlAction{
    
    KWEAKSELF
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadUserFollowListData:weakSelf.page];
    }];
}

-(void)first_LoadUserFollowListViewData{
    if (self.page <= 1 && self.threadArray.count <= 0) {
        [self downLoadUserFollowListData:self.page];
    }
}

#pragma mark - 数据下载
- (void)downLoadUserFollowListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    [[DZNetCenter center] dzx_followShipListWithUser:self.user_id isfan:YES page:self.page completion:^(NSArray<DZQDataFollow *> * _Nonnull varModel, BOOL hasMore,BOOL success) {
        [weakSelf.HUD hide];
        if (success) {
            [weakSelf anylyeUserFollowListData:varModel];
        }else{
            [DZMobileCtrl showAlertError:KError_DataNil];
        }
        if (hasMore) {
            [weakSelf.listView.mj_footer endRefreshing];
        }else{
            [self.listView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
}

/// 分析处理数据
- (void)anylyeUserFollowListData:(NSArray<DZQDataFollow *> *)threadAray {
    
    if (self.page <= 1) {
        [self.threadArray removeAllObjects];
    }else{
        KSLog(@"WBS 该列表暂无数据");
    }
    [self.threadArray addObjectsFromArray:threadAray];
    [self.listView updateMyUserListView:self.threadArray isFrom:YES];
}



-(DZMyUserListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZMyUserListView alloc] initWithListFrame:KView_OutNavi_Bounds];
    }
    return _listView;
}

@end
