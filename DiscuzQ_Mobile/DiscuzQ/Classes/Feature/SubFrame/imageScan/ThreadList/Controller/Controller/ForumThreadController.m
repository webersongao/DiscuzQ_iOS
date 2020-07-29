//
//  ForumThreadController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "ForumThreadController.h"
#import "ForumTool.h"
#import "DZThreadListController.h"
#import "ForumContainListView.h"
#import "ForumThreadMixContainer.h"
#import "DZPostTypeSelectView.h"
#import "DZForTitleModel.h"
#import "ForumInfoView.h"
#import "DZRootForumCell.h"
#import "ForumModel.h"
#import "DZSubForumCell.h"
#import "DropTipView.h"

@interface ForumThreadController () <UITableViewDelegate, UITableViewDataSource>

//YES代表能滑动
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) ForumInfoView *infoView;
@property (nonatomic, strong) DZThreadVarModel *VarModel;
@property (nonatomic, strong) ForumContainListView *tableView;
@property (nonatomic, strong) ForumThreadMixContainer *containVC;
@property (nonatomic, strong) NSMutableArray <DZForTitleModel *> *titleArr;
@property (nonatomic, strong) NSMutableArray<DZThreadListController *> *ctvArr;

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIButton *PostButton;
@property (nonatomic, strong) UITableView *foldTableView;

@property (nonatomic, strong) DropTipView *tipView;
@property (nonatomic, strong) DZPostTypeSelectView *selectView;
@property (nonatomic, strong) NSMutableArray<ForumModel *> *subForumArr;

@end

@implementation ForumThreadController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectIndex = 0;
    self.canScroll = YES;
    [self dl_addNotification];
    self.dz_NavigationItem.title = @"帖子列表";
    
    [self.view addSubview:self.tableView];
    [self.headView addSubview:self.infoView];
    self.headView.height = self.infoView.height;
    self.tableView.tableHeaderView = self.headView;
    [self.headView addSubview:self.foldTableView];
    
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
    
    [self.view addSubview:self.PostButton];
    self.selectView = [[DZPostTypeSelectView alloc] init];
    self.selectView.typeBlock = ^(PostType type) {
        [weakSelf.selectView close];
        [weakSelf switchTypeTopost:type];
    };
    
    // 添加提示视图
    [self.view addSubview:self.tipView];
    self.tipView.clickTipAction = ^{
        [weakSelf toMyThread];
    };
}

- (void)checkForumShowTipView {
    if (self.selectIndex != 0 && !self.VarModel.forum.threadmodcount.integerValue) {
        return;
    }
    if (self.tipView.tipAnimatefinsh == NO) {
        return;
    }
    // 0.设置提醒文字
    if (self.VarModel.forum.threadmodcount) {
        self.tipView.tipLabel.text = [NSString stringWithFormat:@"您有 %@ 个主题等待审核，点击查看",self.VarModel.forum.threadmodcount];
        CGRect orrect = self.tipView.frame;
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.tipView.tipAnimatefinsh = NO;
            self.tipView.frame = CGRectMake(0, 0, orrect.size.width, orrect.size.height);
        } completion:^(BOOL finished) {
            [self performSelector:@selector(hideTipView) withObject:nil afterDelay:3];
        }];
    }
}

- (void)hideTipView {
    CGRect orrect = CGRectMake(0, -KNavi_ContainStatusBar_Height, KScreenWidth, 44);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.tipView.frame = orrect;
    } completion:^(BOOL finished){
        self.tipView.tipAnimatefinsh = YES;
    }];
}

- (void)closeTipView {
    self.tipView.frame = CGRectMake(0, -KNavi_ContainStatusBar_Height, KScreenWidth, 44);
    self.tipView.tipAnimatefinsh = YES;
}

- (void)setIsCollection {
    [self.infoView.collectionBtn setImage:[UIImage imageNamed:@"collection_ok"] forState:UIControlStateNormal];
    self.infoView.collectionBtn.tag =1002;
    if (self.cForumBlock) {
        self.cForumBlock(YES);
    } else {
    }
}

- (void)setNotCollection {
    [self.infoView.collectionBtn setImage:[UIImage imageTintColorWithName:@"collection_no" superView:self.infoView.collectionBtn] forState:UIControlStateNormal];
    self.infoView.collectionBtn.tag=1000;
    if (self.cForumBlock) {
        self.cForumBlock(NO);
    } else {
    }
}

#pragma matk - 按钮点击事件收藏板块
- (void)collectAction:(UIButton*)btn{
    
    if(![self isLogin]) {
        return;
    }
    
    if (btn.tag==1000) {// 收藏
        
        [ForumTool DZ_CollectionForum:self.forumFid success:^{
            [self setIsCollection];
        } failure:nil];
        
    } else if (btn.tag==1002) {//取消
        [ForumTool DZ_DeleCollection:self.forumFid type:collectForum success:^{
            [self setNotCollection];
        } failure:nil];
    }
}

- (void)showTypeView:(UIButton *)button{
    
    if (![self isLogin]) {
        return;
    }
    
    if (!self.VarModel) {
        [MBProgressHUD showInfo:@"等待网络请求"];
        return;
    }
    
    if (self.selectView.typeArray.count == 0) {
        [MBProgressHUD showInfo:@"您当前不能发帖"];
        return;
    } else if (self.selectView.typeArray.count == 1) {
        PostTypeModel *model = self.selectView.typeArray.firstObject;
        [self switchTypeTopost:model.type];
    } else {
        [self.selectView show];
    }
    
}

- (void)switchTypeTopost:(PostType)type {
    [[DZMobileCtrl sharedCtrl] PushToThreadPostController:nil thread:self.VarModel type:type];
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
                    ForumModel *model = [ForumModel modelWithJSON:dic];
                    [self.subForumArr addObject:model];
                }
            }
        }
    } else {
        [self.subForumArr removeAllObjects];
    }
    
    self.foldTableView.frame = CGRectMake(0, self.infoView.height, KScreenWidth, self.subForumArr.count * 68 + 54);
    self.headView.frame = CGRectMake(0, 0, KScreenWidth, self.infoView.height  + CGRectGetHeight(self.foldTableView.frame) + 5);
    self.tableView.tableHeaderView = self.headView;
    [self.foldTableView reloadData];
}

-(void)dl_addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOtherScrollToTop:) name:@"kLeaveTopNtf" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginedRefresh) name:DZ_LoginedRefreshInfo_Notify object:nil];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString * headerSection = @"CellHeader";
    DZRootForumCell *cell = [tableView dequeueReusableCellWithIdentifier:headerSection];
    if (cell == nil) {
        cell = [[DZRootForumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerSection];
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectHeaderWithSection:)];
        [cell addGestureRecognizer:tapG];
    }
    
    if (self.VarModel.sublist.count) {
        cell.textLab.text = [NSString stringWithFormat:@"子版块（%ld）",(unsigned long)self.VarModel.sublist.count];
    }
    
    if (self.subForumArr.count > 0) {
        [cell.button setImage:[UIImage imageTintColorWithName:@"dz_open" superView:cell.button] forState:UIControlStateNormal];
    } else {
        [cell.button setImage:[UIImage imageTintColorWithName:@"dz_close" superView:cell.button] forState:UIControlStateNormal];
        
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.foldTableView)  {
        return 54.0;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.foldTableView) {
        return self.subForumArr.count;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.foldTableView) {
        return 68;
    }
    return self.view.frame.size.height;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.foldTableView) {
        DZSubForumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subForum"];
        if (cell == nil) {
            cell = [[DZSubForumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"subForum"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        ForumModel *model = self.subForumArr[indexPath.row];
        [cell setInfo:model];
        
        return cell;
    } else {
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
            self.containVC.naviBackgroundColor = [UIColor whiteColor];
            [self.containVC configSubControllers:self.ctvArr parentVC:self segmentRect:segmentRect];
        }
        
        return cell;
    }
    
}

- (void)subSendVarible:(DZThreadVarModel *)VarModel {
    // 版块信息设置
    self.VarModel = VarModel;
    if ([DataCheck isValidString:self.VarModel.forum.favorited]) {
        if ([self.VarModel.forum.favorited isEqualToString:@"1"]) {
            [self setIsCollection];
        } else {
            [self setNotCollection];
        }
    }
    
    [self setInfoViewInfo];
    
    if (VarModel.sublist.count) { // 子版块列表
        self.foldTableView.frame  = CGRectMake(0, self.infoView.height, KScreenWidth, 54);
        self.headView.frame = CGRectMake(0, 0, KScreenWidth, self.infoView.height + CGRectGetHeight(self.foldTableView.frame) + 5);
        self.tableView.tableHeaderView = self.headView;
        [self.subForumArr removeAllObjects];
        [self.foldTableView reloadData];
    } else {
        self.foldTableView.frame  = CGRectMake(0, self.infoView.height, KScreenWidth, 0);
        self.headView.frame = CGRectMake(0, 0, KScreenWidth, self.infoView.height);
        self.tableView.tableHeaderView = self.headView;
    }
    
    NSString *allowpost = VarModel.allowperm.allowpost;
    
    NSString *allowpostpoll = checkInteger(VarModel.group.allowpostpoll);
    NSString *allowpostactivity = checkInteger(VarModel.group.allowpostactivity);
    NSString *allowpostdebate = checkInteger(VarModel.group.allowpostdebate);
    NSString *allowspecialonly = checkNull(VarModel.forum.allowspecialonly);
    [self.selectView setPostType:allowpostpoll
                        activity:allowpostactivity
                          debate:allowpostdebate
                allowspecialonly:allowspecialonly
                       allowpost:allowpost];
}

- (void)setInfoViewInfo {
    if ([DataCheck isValidString:self.VarModel.forum.rank]) {
        self.infoView.bankLab.text = [NSString stringWithFormat:@"排名：%@",self.VarModel.forum.rank];
    }
    self.infoView.titleLab.text = self.VarModel.forum.name;
    self.infoView.threadsLab.text = [NSString stringWithFormat:@"主题：%@",self.VarModel.forum.threads];
    if ([DataCheck isValidString:self.VarModel.forum.forum_desc]) {
        self.infoView.describLab.text = self.VarModel.forum.forum_desc;
        [self.infoView layoutIfNeeded];
    }
    self.infoView.height = CGRectGetMaxY(self.infoView.describLab.frame) + 15;
    [self setInfoViewWithIcon:self.VarModel.forum.icon andtodaypost:self.VarModel.forum.todayposts];
}


- (void)setInfoViewWithIcon:(NSString *)icon andtodaypost:(NSString *)todaypost {
    
    [self.infoView.IconV sd_setImageWithURL:[NSURL URLWithString:icon] placeholderImage:[UIImage imageNamed:@"forumCommon_l"] options:SDWebImageRetryFailed];
    
    
    if ([DataCheck isValidString:todaypost]) {
        self.infoView.todayPostLab.text = [NSString stringWithFormat:@"今日：%@", todaypost];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.foldTableView) {
        
        ForumModel *forumModel = self.subForumArr[indexPath.row];
        [[DZMobileCtrl sharedCtrl] PushToForumListController:forumModel.fid];
    }
}

- (void)toMyThread {
    [[DZMobileCtrl sharedCtrl] PushToMyThreadViewController];
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
            [self hideTipView];
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

- (DropTipView *)tipView {
    if (!_tipView) {
        _tipView = [[DropTipView alloc] initWithFrame:CGRectMake(0, -KNavi_ContainStatusBar_Height, KScreenWidth, KNavi_ContainStatusBar_Height)];
        _tipView.tipAnimatefinsh = YES;
        _tipView.userInteractionEnabled = YES;
        [_tipView.closeBtn addTarget:self action:@selector(closeTipView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tipView;
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

-(UIView *)headView{
    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, self.infoView.height)];
        _headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _headView;
}

-(ForumInfoView *)infoView{
    if (_infoView == nil) {
        _infoView = [[ForumInfoView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 75 + 10)];
        [_infoView.collectionBtn addTarget:self action:@selector(collectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _infoView;
}


-(UITableView *)foldTableView{
    if (_foldTableView == nil) {
        _foldTableView = [[DZBaseTableView alloc] initWithFrame:CGRectMake(0, self.infoView.height, KScreenWidth, 0) style:UITableViewStylePlain];
        _foldTableView.delegate = self;
        _foldTableView.dataSource = self;
    }
    return _foldTableView;
}

-(NSMutableArray<DZForTitleModel *> *)titleArr {
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray array];
        [_titleArr addObject:[DZForTitleModel modelName:@"全部" type:DZ_ListAll]];
        [_titleArr addObject:[DZForTitleModel modelName:@"最新" type:DZ_ListNew]];
        [_titleArr addObject:[DZForTitleModel modelName:@"热门" type:DZ_ListHot]];
        [_titleArr addObject:[DZForTitleModel modelName:@"精华" type:DZ_ListBest]];
    }
    return _titleArr;
}

-(UIButton *)PostButton{
    if (_PostButton == nil) {
        CGFloat btn_width = 50.0;
        _PostButton = [UIButton ButtonNormalWithFrame:CGRectMake(KScreenWidth - btn_width - 15, KScreenHeight - btn_width - 15 - KNavi_ContainStatusBar_Height - 10, btn_width, btn_width) title:@"" titleFont:nil titleColor:nil normalImgPath:@"writePost" touchImgPath:@"writePost" isBackImage:YES];
        [_PostButton addTarget:self action:@selector(showTypeView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PostButton;
}

-(NSMutableArray<DZThreadListController *> *)ctvArr{
    if (!_ctvArr) {
        _ctvArr = [NSMutableArray arrayWithCapacity:3];
        for (int idx = 0; idx < self.titleArr.count; idx++) {
            DZForTitleModel *obj = self.titleArr[idx];
            DZThreadListController *listVc = [[DZThreadListController alloc] initWithType:obj.listType fid:self.forumFid order:idx];
            listVc.title = obj.name;
            listVc.dataBlockWhenAll = ^(DZThreadVarModel *varModel) {
                [self subSendVarible:varModel];
            };
            listVc.endRefreshBlock = ^{
                [self checkForumShowTipView];
                [self.tableView.mj_header endRefreshing];
            };
            [_ctvArr addObject:listVc];
        };
    }
    return _ctvArr;
}


@end




