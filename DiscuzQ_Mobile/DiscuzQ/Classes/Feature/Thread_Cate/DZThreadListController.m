//
//  DZThreadListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZThreadListController.h"

@interface DZThreadListController ()

@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger order;
@property (nonatomic, assign) DZ_ListType listType;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataThread *> *threadArray;  //!< 属性注释
@end

@implementation DZThreadListController

- (instancetype)initWithCateid:(NSString *)fid order:(NSInteger)order
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.cate_id = fid;
        self.order = order;
        self.listType = order;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configDiscoverCateCtrlAction];
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
    [self.dz_NavigationBar removeFromSuperview];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstThreadListRequest:) name:DZ_ThreadListFirstReload_Notify object:nil];
}

-(void)configDiscoverCateCtrlAction{
    
    KWEAKSELF
    self.listView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf downLoadCateListData:weakSelf.page];
    }];
    
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadCateListData:weakSelf.page];
    }];
}

-(void)updateSuperCateThreadListCtrlView{
    if (self.page <= 1 && self.threadArray.count <= 0) {
        [self downLoadCateListData:self.page];
    }
}

#pragma mark - 数据下载
- (void)downLoadCateListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    NSString *filter = @"";
    filter = (self.listType == DZ_ListVideo) ? @"filter[type]=2" : filter; // 视频主题
    filter = (self.listType == DZ_ListBest) ? @"filter[isEssence]=yes" : filter;
    
    [[DZNetCenter center] dzx_threadListWithSuperCate:self.cate_id morefilter:filter page:page completion:^(NSArray<DZQDataThread *> *varModel, BOOL hasMore,BOOL success) {
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
        [self.listView.mj_header endRefreshing];
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



- (void)firstThreadListRequest:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    if ([DataCheck isValidDict:userInfo]) {
        NSInteger index = [[userInfo objectForKey:@"selectIndex"] integerValue];
        if (index == self.order && !self.threadArray.count) {
            [self updateSuperCateThreadListCtrlView];
        }
    }
}


-(DZDiscoverListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZDiscoverListView alloc] initWithListFrame:self.view.bounds];
    }
    return _listView;
}




@end



