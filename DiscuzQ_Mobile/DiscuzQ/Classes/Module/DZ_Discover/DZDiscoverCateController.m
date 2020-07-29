//
//  DZDiscoverCateController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZDiscoverCateController.h"
#import "DZDiscoverListView.h"
#import "DZBaseForumModel.h"

@interface DZDiscoverCateController ()
{
    CGRect m_frame;
}
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) DZDiscoverListView *listView;  //!< 属性注释
@property (nonatomic, strong,readonly) DZQDataCate *cateModel;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataThread *> *threadArray;  //!< 属性注释

@end

@implementation DZDiscoverCateController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZQDataCate *)model
{
    self = [super init];
    if (self) {
        self.page = 1;
        m_frame = frame;
        _cateModel = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = m_frame;
    [self configDiscoverCateCtrlAction];
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
    [self.dz_NavigationBar removeFromSuperview];
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

-(void)updateDiscoverCateControllerView{
    if (self.page <= 1 && self.threadArray.count <= 0) {
        [self downLoadCateListData:self.page];
    }
}

#pragma mark - 数据下载
- (void)downLoadCateListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    [[DZNetCenter center] dzx_threadListWithCate:self.cateModel.type_id page:page completion:^(NSArray<DZQDataThread *> *varModel, BOOL hasMore,BOOL success) {
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

#pragma mark   /********************* 视频播放 *************************/


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.listView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        [[DZMediaCenter Center] playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
    }];
}

#pragma mark   /********************* 初始化 *************************/


-(DZDiscoverListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZDiscoverListView alloc] initWithListFrame:self.view.bounds];
    }
    return _listView;
}




@end
