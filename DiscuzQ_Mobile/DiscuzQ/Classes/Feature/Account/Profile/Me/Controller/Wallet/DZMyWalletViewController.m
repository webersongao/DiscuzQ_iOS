//
//  DZMyWalletViewController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyWalletViewController.h"
#import "DZWalletCashListView.h"

@interface DZMyWalletViewController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) DZWalletCashListView *listView;  //!< 属性注释
@property (nonatomic, strong,readonly) DZQDataCate *cateModel;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataCashLog *> *cashArray;  //!< 属性注释

@end

@implementation DZMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的钱包";
    [self configDiscoverCateCtrlAction];
    [self.view addSubview:self.listView];
    [self first_loadMyCashLogViewData];
    [self downLoadUserWalletInfoData];
}

-(void)configDiscoverCateCtrlAction{
    
    KWEAKSELF
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadCashLogListData:weakSelf.page];
    }];
}

-(void)first_loadMyCashLogViewData{
    if (self.page <= 1 && self.cashArray.count <= 0) {
        [self downLoadCashLogListData:self.page];
    }
}


#pragma mark - 数据下载
#pragma mark - 数据下载
- (void)downLoadUserWalletInfoData {
    
    KWEAKSELF
    NSString *user_id = [DZMobileCtrl sharedCtrl].User.user_id;
    [[DZNetCenter center] dzx_userWalletInfoWithUser_id:user_id completion:^(DZQDataWallet * dataWallet, BOOL success) {
        [weakSelf.listView updateWalletCashHeader:dataWallet];
    }];
}

- (void)downLoadCashLogListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    NSString *user_id = [DZMobileCtrl sharedCtrl].User.user_id;
    KWEAKSELF
    [[DZNetCenter center] dzx_userWalletLoglistWithUser:user_id page:self.page completion:^(NSArray<DZQDataCashLog *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
        [weakSelf.HUD hide];
        if (success) {
            [weakSelf anylyeMyCashLogListData:varModel];
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
- (void)anylyeMyCashLogListData:(NSArray<DZQDataCashLog *> *)threadAray {
    
    if (self.page <= 1) {
        [self.cashArray removeAllObjects];
    }else{
        KSLog(@"WBS 该列表暂无数据");
    }
    [self.cashArray addObjectsFromArray:threadAray];
    [self.listView updateWalletCashListView:self.cashArray];
}



#pragma mark   /********************* 初始化 *************************/


-(DZWalletCashListView *)listView{
    if (!_listView) {
        _cashArray = [NSMutableArray array];
        _listView = [[DZWalletCashListView alloc] initWithListFrame:KView_OutNavi_Bounds];
    }
    return _listView;
}


@end
