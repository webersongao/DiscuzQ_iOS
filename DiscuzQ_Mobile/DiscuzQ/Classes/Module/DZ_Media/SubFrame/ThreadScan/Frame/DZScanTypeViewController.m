//
//  DZScanTypeViewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScanTypeViewController.h"
#import "DZHomeListView.h"
#import "DZThreadTypeModel.h"
#import "DZThreadCollectionView.h"

@interface DZScanTypeViewController ()
{
    CGRect m_frame;
}
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释
@property (nonatomic, strong,readonly) DZThreadTypeModel *cateModel;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZQDataThread *> *threadArray;  //!< 属性注释

@end

@implementation DZScanTypeViewController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZThreadTypeModel *)model
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
    [self configHomeCateCtrlAction];
    [self.view addSubview:self.listView];
    self.view.backgroundColor = KDebug_Color;
    [self.dz_NavigationBar removeFromSuperview];
}

-(void)configHomeCateCtrlAction{
    
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

-(void)updateHomeCateControllerView{
    if (self.page <= 1 && self.threadArray.count <= 0) {
        [self downLoadCateListData:self.page];
    }
}

#pragma mark - 数据下载
- (void)downLoadCateListData:(NSInteger)page {
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    [[DZNetCenter center] dzx_threadListWithType:self.cateModel.typeId.integerValue page:page completion:^(NSArray<DZQDataThread *> *varModel, BOOL hasMore,BOOL success) {
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
    [self.listView updateHomeListView:self.threadArray];
}

#pragma mark   /********************* 视频播放 *************************/


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.listView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        [[DZMediaCenter Center] playTheVideoAtIndexPath:indexPath scrollAnimated:NO];
    }];
}

#pragma mark   /********************* 初始化 *************************/


-(DZHomeListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZHomeListView alloc] initWithListFrame:self.view.bounds];
    }
    return _listView;
}




@end
