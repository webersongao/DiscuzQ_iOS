//
//  DZThreadDetailController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailController.h"
#import "DZThreadDetailListView.h"
#import "DZBottomToolBar.h"

@interface DZThreadDetailController ()

@property (nonatomic, copy) NSString *thread_id;
@property (nonatomic, assign) NSInteger postPage;
@property (nonatomic, strong) DZBottomToolBar *bottomBar;  //!< 属性注释
@property (nonatomic, strong) DZThreadDetailListView *detailView;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray *postDataArray;  //!< 评论数据

@end

@implementation DZThreadDetailController

- (instancetype)initWithThread:(NSString *)thread_id
{
    self = [super init];
    if (self) {
        self.postPage = 1;
        self.thread_id = thread_id;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self config_DetailController];
    [self loadThreadDetailinfomation];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.bottomBar showBottomToolBar:YES];
}


-(void)config_DetailController{
    
    [self.view addSubview:self.detailView];
    [self.view addSubview:self.bottomBar];
    self.postDataArray = [NSMutableArray array];
    
    KWEAKSELF
    self.detailView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.postPage++;
        [weakSelf loadThreadPostWithPage:self.postPage completion:nil];
    }];
    
}

// 获取数据
-(void)loadThreadDetailinfomation{
    
    KWEAKSELF
    self.postPage = 1;
    [[DZNetCenter center] dzx_threadOneWithThreadId:self.thread_id completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
        if (success) {
            [weakSelf loadThreadPostWithPage:weakSelf.postPage completion:^(NSArray<DZQDataPost *> *postArr, BOOL hasMore) {
                [weakSelf updateDetailView:threadData post:postArr more:hasMore];
            }];
        }else{
            [DZMobileCtrl showAlertError:@"数据异常,请稍后重试"];
        }
    }];
}

-(void)loadThreadPostWithPage:(NSInteger)postPage completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    KWEAKSELF
    [[DZNetCenter center] dzx_PostListWithThreadId:self.thread_id page:self.postPage completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
        if (weakSelf.postPage <= 1 && completion) {
            completion(postArr,hasMore);
        }else{
            [weakSelf updateDetailView:nil post:postArr more:hasMore];
        }
    }];
}

-(void)updateDetailView:(DZQDataThread *)dataModel post:(NSArray<DZQDataPost *> *)postArray more:(BOOL)hasMore{
    
    if (self.postPage <= 1) {
        if (dataModel) {
            [self.detailView updateThreadHeadDetail:dataModel];
            self.title = dataModel.attributes.title.length ? dataModel.attributes.title : @"详情";
        }else{
            postArray = nil;
        }
    }
    self.detailView.mj_footer.hidden = NO;
    if (hasMore) {
        [self.detailView.mj_footer endRefreshing];
    }else{
        [self.detailView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.postDataArray addObjectsFromArray:postArray];
    [self.detailView updateThreadPostDetail:self.postDataArray];
    
}


-(DZThreadDetailListView *)detailView{
    if (!_detailView) {
        _detailView = [[DZThreadDetailListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStyleGrouped];
        _detailView.mj_footer.hidden = YES;
    }
    return _detailView;
}

-(DZBottomToolBar *)bottomBar{
    if (_bottomBar == nil) {
        _bottomBar = [[DZBottomToolBar alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth, KBottom_Height_X) Mode:toolBar_comment];
    }
    return _bottomBar;
}





@end
















