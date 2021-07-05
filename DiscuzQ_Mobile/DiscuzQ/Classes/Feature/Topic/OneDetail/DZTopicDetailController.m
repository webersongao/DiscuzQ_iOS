//
//  DZTopicDetailController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZTopicDetailController.h"
#import "DZHomeListView.h"
#import "DZTopicHeaderView.h"

@interface DZTopicDetailController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *threadArray;  //!< 属性注释
@property (nonatomic, strong) DZTopicHeaderView *headView;  //!< 属性注释
@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释

@end

@implementation DZTopicDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"话题详情";
    [self cofig_TopicDetailView];
    [self configTopicDetailListlAction];
}

-(void)cofig_TopicDetailView{
    [self.view addSubview:self.listView];
    [self downLoadTopicThemeDetailData];
    [self downLoadTopicThemeListData:self.page];
    self.listView.tableHeaderView = self.headView;
    [self configNaviBar:@"navi_dzMore" type:NaviItemImage Direction:NaviDirectionRight];
}

-(void)configTopicDetailListlAction{
    
    KWEAKSELF
    self.listView.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf downLoadTopicThemeListData:weakSelf.page];
    }];
    
    self.listView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadTopicThemeListData:weakSelf.page];
    }];
    
    [self.headView configTAction:self skip:@selector(rightAllAction:) filter:@selector(filterAction:)];
}

#pragma mark - 数据下载
- (void)downLoadTopicThemeDetailData {
    
    KWEAKSELF
    [[DZNetCenter center] dzx_TopicOneOfThreadWithTopic:self.topicId completion:^(DZQDataTopic * _Nonnull dataTopic, BOOL success) {
        if (success) {
            [weakSelf.headView updateTopicDetailHeader:dataTopic];
        }else{
           [DZMobileCtrl showAlertError:KError_DataNil];
        }
    }];
}

- (void)downLoadTopicThemeListData:(NSInteger)page {
    
    if (self.page > 1 && !self.headView.isReady) {
        // 补充 detail加载失败的情况
        [self downLoadTopicThemeDetailData];
    }
    
    [self.HUD showLoadingMessag:@"加载中" toView:self.view];
    KWEAKSELF
    [[DZNetCenter center] dzx_threadListWithTopic:self.topicId page:self.page completion:^(NSArray<DZQDataThread *> * _Nonnull varModel, BOOL hasMore, BOOL success) {
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

// 全部话题（话题列表页面）
-(void)rightAllAction:(UIButton *)button{
    KSLog(@"WBS 全部话题（话题列表页---）");
    [[DZMobileCtrl sharedCtrl] PushToTopicListViewController];
}

// 相同话题下 筛选
-(void)filterAction:(UIButton *)button{
    KSLog(@"WBS  相同话题下 筛选----");
}

-(void)rightBarBtnClick:(UIButton *)button{
    KSLog(@"WBS 分享该话题 -----");
}

-(DZTopicHeaderView *)headView{
    if (!_headView) {
        _headView = [[DZTopicHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    }
    return _headView;
}

-(DZHomeListView *)listView{
    if (!_listView) {
        _threadArray = [NSMutableArray array];
        _listView = [[DZHomeListView alloc] initWithListFrame:KView_OutNavi_Bounds];
    }
    return _listView;
}

@end
