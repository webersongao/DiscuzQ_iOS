//
//  DZFavoriteThreadController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteThreadController.h"
#import "CollectionViewCell.h"

@interface DZFavoriteThreadController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataThread *> *threadArray;  //!< 属性注释

@end

@implementation DZFavoriteThreadController

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
    self.title = @"收藏列表";
    [self configDiscoverCateCtrlAction];
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self first_LoadMyLikeThreadViewData];
}

//
-(void)configDiscoverCateCtrlAction{
    
    KWEAKSELF
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadCateListData:weakSelf.page];
    }];
}

-(void)first_LoadMyLikeThreadViewData{
    if (self.page <= 1 && self.threadArray.count <= 0) {
        [self downLoadCateListData:self.page];
    }
}

#pragma mark - 数据下载
- (void)downLoadCateListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    [[DZNetCenter center] dzx_threadFavoriteListWithUser:self.user_id page:page completion:^(NSArray<DZQDataThread *> *varModel, BOOL hasMore,BOOL success) {
        [weakSelf.HUD hide];
        if (success) {
            [weakSelf anylyeThreadListData:varModel];
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
- (void)anylyeThreadListData:(NSArray<DZQDataThread *> *)threadAray {
    
    if (self.page <= 1) {
        [self.threadArray removeAllObjects];
    }else{
        KSLog(@"WBS 该列表暂无数据");
    }
    [self.threadArray addObjectsFromArray:threadAray];
    [self.listView updateDiscoverListView:self.threadArray];
}


-(DZDiscoverListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZDiscoverListView alloc] initWithListFrame:KView_OutNavi_Bounds];
    }
    return _listView;
}

@end
