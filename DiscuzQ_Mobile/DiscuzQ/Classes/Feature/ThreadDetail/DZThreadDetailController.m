//
//  DZThreadDetailController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailController.h"
#import "DZThreadDetailListView.h"
#import "DZThreadHelper.h"
#import "DZBottomToolBar.h"

@interface DZThreadDetailController ()<detailListViewDelgate>

@property (nonatomic, copy) NSString *thread_id;
@property (nonatomic, assign) NSInteger postPage;
@property (nonatomic, strong) DZQDataThread *dataThread;  //!< 属性注释
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
    self.detailView.mj_footer.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.bottomBar showBottomToolBar:YES];
}

-(void)config_DetailController{
    
    [self.view addSubview:self.detailView];
    [self.view addSubview:self.bottomBar];
    self.postDataArray = [NSMutableArray array];
    [self configNaviBar:@"dz_list_more" type:NaviItemImage Direction:NaviDirectionRight];
    self.dz_NavigationBar.rightButton.alpha = 0;
    
    KWEAKSELF
    self.detailView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.postPage++;
        [weakSelf loadThreadPostWithPage:self.postPage completion:nil];
    }];
    
    self.bottomBar.leftMainBlock = ^(UIButton *button) {
        [DZThreadHelper thread_CommentCellAction:weakSelf.dataThread.attributes];
    };
    
    self.bottomBar.rightBlock = ^(UIButton *button) {
        [DZThreadHelper thread_LikeCellAction:weakSelf.dataThread.relationships.firstPost.attributes block:^(BOOL boolState) {
            button.selected = boolState;
        }];
    };
    
}

// 获取数据
-(void)loadThreadDetailinfomation{
    
    KWEAKSELF
    self.postPage = 1;
    [[DZMobileCtrl sharedCtrl] showHub];
    [[DZNetCenter center] dzx_threadOneWithThreadId:self.thread_id completion:^(DZQDataThread * _Nonnull threadData, BOOL success) {
        [[DZMobileCtrl sharedCtrl] hideHubView];
        if (success) {
            [weakSelf updateDetailHeaderView:threadData];
            [weakSelf loadThreadPostWithPage:weakSelf.postPage completion:^(NSArray<DZQDataPost *> *postArr, BOOL hasMore) {
                [weakSelf updateDetailPostList:postArr more:hasMore];
            }];
        }else{
            [DZMobileCtrl showAlertError:KError_DataNil];
        }
    }];
}

-(void)loadThreadPostWithPage:(NSInteger)postPage completion:(void (^)(NSArray<DZQDataPost *> *postArr,BOOL hasMore))completion{
    
    KWEAKSELF
    [[DZNetCenter center] dzx_PostListWithThreadId:self.thread_id page:self.postPage completion:^(NSArray<DZQDataPost *> * _Nonnull postArr, BOOL hasMore) {
        if (weakSelf.postPage <= 1 && completion) {
            completion(postArr,hasMore);
        }else{
            [weakSelf updateDetailPostList:postArr more:hasMore];
        }
    }];
}

-(void)updateDetailHeaderView:(DZQDataThread *)dataModel {
    self.dataThread = dataModel;
    [self.detailView updateThreadHeadDetail:dataModel];
    [self.detailView updateThreadPostDetail:nil];
    [self.bottomBar updateDetailBottomBar:dataModel.relationships.firstPost];
    self.title = dataModel.attributes.title.length ? dataModel.attributes.title : @"详情";
}

-(void)updateDetailPostList:(NSArray<DZQDataPost *> *)postArray more:(BOOL)hasMore{
    
    
    self.detailView.mj_footer.hidden = NO;
    if (hasMore) {
        [self.detailView.mj_footer endRefreshing];
    }else{
        [self.detailView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.postDataArray addObjectsFromArray:postArray];
    [self.detailView updateThreadPostDetail:self.postDataArray];
    
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    if (!parent) {
        if (self.detailVCPopCallback) {
            self.detailVCPopCallback();
        }
    }
}

-(void)rightBarBtnClick:(UIButton *)button{
    
    [DZThreadHelper thread_MoreCellAction:self.dataThread sender:button];
    
}
#pragma mark detailListViewDelgate

- (void)detailListView:(DZThreadDetailListView *)detailListView scrollDidScroll:(CGFloat)offsetY{
    UIButton *rightButton  = self.dz_NavigationBar.rightButton;
    rightButton.alpha = offsetY / kToolBarHeight;
}

- (void)detaiVideoView:(DZMediaPlayView *)videoView videoDidPlayClick:(DZQDataVideo *)dataVideo{
    if (self.detailVCPlayCallback) {
        self.detailVCPlayCallback(videoView);
    }
}

-(DZThreadDetailListView *)detailView{
    if (!_detailView) {
        _detailView = [[DZThreadDetailListView alloc] initWithFrame:KView_OutNaviTab_Bounds];
        _detailView.detailDelegate = self;
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
















