//
//  DZMsgDetailListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/7/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZMsgDetailListController.h"
#import "DZMsgDetailListView.h"


@interface DZMsgDetailListController ()

@property (nonatomic, assign) NSInteger page;  //!< 属性注释
@property (nonatomic, strong) DZNotiItem *NotiItem;
@property (nonatomic, strong) NSMutableArray *notiArray;  //!< 属性注释
@property (nonatomic, strong) DZMsgDetailListView *listView;  //!< 属性注释

@end

@implementation DZMsgDetailListController

- (instancetype)initWithItem:(DZNotiItem *)item
{
    self = [super init];
    if (self) {
        self.NotiItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self config_DetailListCtrl];
    [self loadMsgHistoryListData];
    self.title = self.NotiItem.noti_Name;
}

-(void)config_DetailListCtrl{
    
    self.page = 1;
    [self.view addSubview:self.listView];
    KWEAKSELF;
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf loadMsgHistoryListData];
    }];
}

- (void)loadMsgHistoryListData {
    
    KWEAKSELF
    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
    [[DZNetCenter center] dzx_notiListWithTypeFilter:self.NotiItem.NotiType completion:^(NSArray<DZQDataNoti *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
        [weakSelf.HUD hideAnimated:YES];
        [weakSelf mj_endRefreshing:hasMore];
        [weakSelf anylyeLocalMsgData:varModel];
    }];
}

- (void)anylyeLocalMsgData:(NSArray<DZQDataNoti *> *)notiArray {
    
    if (self.page == 1) {
        self.notiArray = [[NSMutableArray alloc] initWithArray:notiArray];
    }else{
        [self.notiArray addObjectsFromArray:notiArray];
    }
    
    [self.listView updateDetailListView:self.notiArray];
    
}

- (void)mj_endRefreshing:(BOOL)has_More {
    if (has_More) {
        [self.listView.mj_footer endRefreshing];
    }else{
        [self.listView.mj_footer endRefreshingWithNoMoreData];
    }
}

-(DZMsgDetailListView *)listView{
    if (!_listView) {
        _listView = [[DZMsgDetailListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
    }
    return _listView;
}







@end
