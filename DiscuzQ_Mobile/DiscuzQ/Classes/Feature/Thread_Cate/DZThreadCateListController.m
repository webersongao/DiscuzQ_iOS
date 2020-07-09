//
//  DZThreadCateListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZThreadCateListController.h"
#import "ForumThreadMixContainer.h"
#import "DZThreadListController.h"
#import "ForumContainListView.h"
#import "DZForumCateHeader.h"
#import "DZRootForumCell.h"
#import "DZForTitleModel.h"
#import "DZSubForumCell.h"
#import "ForumModel.h"

@interface DZThreadCateListController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL canScroll; //YES:可滑动
@property (nonatomic, strong) DZThreadVarModel *VarModel;
@property (nonatomic, strong) ForumContainListView *tableView;
@property (nonatomic, strong) ForumThreadMixContainer *containVC;
@property (nonatomic, strong) NSMutableArray <DZForTitleModel *> *titleArr;
@property (nonatomic, strong) NSMutableArray<DZThreadListController *> *ctvArr;

@property (nonatomic, strong) DZForumCateHeader *headView;
@property (nonatomic, strong) UIButton *PostButton;

@property (nonatomic, strong) NSMutableArray<ForumModel *> *subForumArr;

@end

@implementation DZThreadCateListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectIndex = 0;
    self.canScroll = YES;
    [self dl_addNotification];
    
    [self config_threadCateListCtrl];
}


-(void)config_threadCateListCtrl{
    
    [self.view addSubview:self.tableView];
    self.title = self.dataCate.attributes.name;
    self.tableView.tableHeaderView = self.headView;
    [self.headView updateCateHeader:self.dataCate];
    
    [self.view addSubview:self.PostButton];
    
    KWEAKSELF;
    self.tableView.mj_header  = [DZRefreshHeader headerWithRefreshingBlock:^{
        if (weakSelf.ctvArr.count > 0) {
            DZThreadListController *fVc = weakSelf.ctvArr[weakSelf.selectIndex];
            [fVc refreshThreadListData];
        } else {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        //        [weakSelf refreshData];
    }];
}

-(void)fastPostAction:(UIButton *)button{
    
    [[DZMobileCtrl sharedCtrl] PushToPostTabViewController];
}

- (void)loginedRefresh {
    if (self.ctvArr.count > 0) {
        DZThreadListController *fVc = self.ctvArr[self.selectIndex];
        [fVc refreshThreadListData];
    } else {
        [self.tableView.mj_header endRefreshing];
    }
}

- (void)didSelectHeaderWithSection:(UITapGestureRecognizer *)sender {
    
    if (self.subForumArr.count == 0) {
        if (self.VarModel.sublist.count) {
            if (self.subForumArr.count == 0) {
                for (NSDictionary *dic in self.VarModel.sublist) {
                    ForumModel *model = [ForumModel yy_modelWithJSON:dic];
                    [self.subForumArr addObject:model];
                }
            }
        }
    } else {
        [self.subForumArr removeAllObjects];
    }
}

-(void)dl_addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOtherScrollToTop:) name:@"kLeaveTopNtf" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginedRefresh) name:DZ_LoginedRefreshInfo_Notify object:nil];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.view.height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommonId"];
    if (cell == nil) {
        cell = [[DZBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommonId"];
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.ctvArr && self.ctvArr.count) {
        self.contentView = cell.contentView;
        self.containVC = [[ForumThreadMixContainer alloc] init];
        CGRect segmentRect = CGRectMake(0, 0, KScreenWidth, kToolBarHeight);
        self.containVC.naviBackColor = KDebug_Color;
        [self.containVC configSubControllers:self.ctvArr parentVC:self segmentRect:segmentRect];
    }
    
    return cell;
    
}

- (void)subSendVarible:(DZThreadVarModel *)VarModel {
    // 版块信息设置
    self.VarModel = VarModel;
    
    if (VarModel.sublist.count) { // 子版块列表
        self.headView.frame = CGRectMake(0, 0, KScreenWidth, self.headView .height + 5);
        self.tableView.tableHeaderView = self.headView;
        [self.subForumArr removeAllObjects];
    } else {
        self.headView.frame = CGRectMake(0, 0, KScreenWidth, self.headView.height);
        self.tableView.tableHeaderView = self.headView;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KSLog(@"WBS  didSelectRowAtIndexPath  点击了");
}

- (void)toMyThread {
    [[DZMobileCtrl sharedCtrl] PushToMyThreadListController];
}

- (void)setScrollEnable:(BOOL)scrollable {
    self.tableView.scrollEnabled = scrollable;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //子控制器和主控制器之间的滑动状态切换
    CGFloat tabOffsetY = [_tableView rectForSection:0].origin.y;
    if (scrollView.contentOffset.y >= tabOffsetY) { // 调整下主控制器滚不动，子控制器滚动
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        if (self.canScroll) {
            self.canScroll = NO;
            self.containVC.childCanScroll = YES;
        }
    } else if (!self.canScroll) {
        // 调整下主控制器滚不动，子控制器滚动
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
    }
    
    // *********** 其余情况就是主控制器滚动 子控制器不滚动
}

///通知的处理
//子控制器到顶部了 主控制器可以滑动
- (void)onOtherScrollToTop:(NSNotification *)ntf {
    self.canScroll = YES;
    self.containVC.childCanScroll = NO;
}

#pragma mark - setter、getter


- (NSMutableArray<ForumModel *> *)subForumArr {
    if (!_subForumArr) {
        _subForumArr = [NSMutableArray array];
    }
    return _subForumArr;
}

-(ForumContainListView *)tableView{
    if (_tableView == nil) {
        _tableView = [[ForumContainListView alloc] initWithFrame:KView_OutNavi_Bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _tableView;
}

-(DZForumCateHeader *)headView{
    if (_headView == nil) {
        _headView = [[DZForumCateHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,80)];
    }
    return _headView;
}

-(NSMutableArray<DZForTitleModel *> *)titleArr {
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray array];
        [_titleArr addObject:[DZForTitleModel modelName:@"全部" type:DZ_ListAll]];
        [_titleArr addObject:[DZForTitleModel modelName:@"精华" type:DZ_ListBest]];
        [_titleArr addObject:[DZForTitleModel modelName:@"已关注" type:DZ_ListFollow]];
    }
    return _titleArr;
}

-(UIButton *)PostButton{
    if (_PostButton == nil) {
        CGFloat btn_width = 50.0;
        _PostButton = [UIButton ButtonNormalWithFrame:CGRectMake(KScreenWidth - btn_width - 15, KScreenHeight - btn_width - 15 - KNavi_ContainStatusBar_Height - 10, btn_width, btn_width) title:@"" titleFont:nil titleColor:nil normalImgPath:@"writePost" touchImgPath:@"writePost" isBackImage:YES picAlpha:1];
        [_PostButton addTarget:self action:@selector(fastPostAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PostButton;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSMutableArray<DZThreadListController *> *)ctvArr{
    if (!_ctvArr) {
        _ctvArr = [NSMutableArray arrayWithCapacity:3];
        for (int idx = 0; idx < self.titleArr.count; idx++) {
            DZForTitleModel *obj = self.titleArr[idx];
            DZThreadListController *listVc = [[DZThreadListController alloc] initWithType:obj.listType fid:self.dataCate.type_id order:idx];
            listVc.title = obj.name;
            listVc.dataBlockWhenAll = ^(DZThreadVarModel *varModel) {
                [self subSendVarible:varModel];
            };
            listVc.endRefreshBlock = ^{
                [self.tableView.mj_header endRefreshing];
            };
            [_ctvArr addObject:listVc];
        };
    }
    return _ctvArr;
}


@end




