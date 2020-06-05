//
//  ForumIndexListController.m
//  DiscuzQ
//
//  Created by piter on 2018/1/30.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "ForumIndexListController.h"
#import "ForumNodeModel.h"
#import "ForumLeftCell.h"
#import "ForumRightCell.h"
#import "DZBaseTableView.h"
#import "ForumTool.h"
#import "DZCollectButton.h"
#import "DZThreadNetTool.h"

#define lineTag  2018

@interface ForumIndexListController ()

@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic, strong) DZBaseTableView *leftMenuList;

@end

@implementation ForumIndexListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.leftMenuList];
    [self.dz_NavigationBar removeFromSuperview];
    self.tableView.backgroundColor = KLightLine_Color;
    [self.leftMenuList registerClass:[ForumLeftCell class] forCellReuseIdentifier:@"ForumLeftCell"];
    [self.tableView registerClass:[ForumRightCell class] forCellReuseIdentifier:@"ForumRightCell"];
    self.tableView.frame = CGRectMake(self.leftMenuList.right, self.leftMenuList.top, KScreenWidth*0.78, self.leftMenuList.height);
    
    // 下载数据
    [self cacheAndRequest];
    
    // 刷新
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:DZ_TabbarRefresh_Notify object:nil];
    // 监听通知 收藏板块操作后，如果没有blockc传入，就必须发通知刷新这个页面数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:DZ_CollectionInfoRefresh_Notify object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:DZ_DomainUrlChange_Notify object:nil];
}

- (void)cacheAndRequest {
    [self.HUD showLoadingMessag:@"正在刷新" toView:self.view];
    [self loadDataWithType:DZRLoadCache];
}

- (void)refreshData {
    [self loadDataWithType:DZRLoadRefresh];
}


// 下载数据
- (void)loadDataWithType:(DZRLoadType)loadType {
    
    [DZThreadNetTool DZ_DownloadForumCategoryData:loadType isCache:YES completion:^(DiscoverModel *indexModel) {
        [self.HUD hide];
        if (indexModel) {
            [self.tableView.mj_header endRefreshing];
            [self.dataSourceArr removeAllObjects];
            self.dataSourceArr = [NSMutableArray arrayWithArray:indexModel.catlist];
            [self.tableView reloadData];
            [self.leftMenuList reloadData];
        }else{
            [DZMobileCtrl showAlertWarn:@"数据异常，稍后重试"];
        }
    }];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.leftMenuList) {
        return 1;
    }
    return self.dataSourceArr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftMenuList) {
        return self.dataSourceArr.count;
    }
    ForumNodeModel *node = self.dataSourceArr[section];
    return node.childNode.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ForumNodeModel *node = self.dataSourceArr[indexPath.section];
    if (tableView == self.leftMenuList) {
        ForumLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForumLeftCell"];
        node = self.dataSourceArr[indexPath.row];
        [cell updateCellLabel:node.name];
        return cell;
    } else {
        ForumRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForumRightCell"];
        KWEAKSELF;
        cell.collectionBlock = ^(DZCollectButton *sender,DZBaseForumModel *infoModel) {
            [weakSelf collectAction:sender andModel:infoModel];
        };
        
        [cell updateRightCellInfo:node.childNode[indexPath.row].infoModel];
        return cell;
    }
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftMenuList) {
        return kToolBarHeight;
    }
    return kCellHeight_65;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        ForumNodeModel *node = self.dataSourceArr[section];
        return node.name;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftMenuList) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        self.isSelected = YES;
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ForumNodeModel * node = self.dataSourceArr[indexPath.section];
        node = node.childNode[indexPath.row];
        [self pushIndexThreadList:node];
    }
}

// 跳转列表页
- (void)pushIndexThreadList:(ForumNodeModel *)node {
    KWEAKSELF;
    [[DZMobileCtrl sharedCtrl] PushToForumListController:node.infoModel.fid block:^(BOOL boolState) {
        if (boolState) {
            node.infoModel.favorited = @"1";
        } else {
            node.infoModel.favorited = @"0";
        }
        [weakSelf.tableView reloadData];
    }];
}

// 向下滑（将出现的要重新计算一下）
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.font = KFont(12);
    header.contentView.backgroundColor = [UIColor whiteColor];
    for (UIView *subview in header.subviews) {
        if (subview.tag == lineTag) {
            [subview removeFromSuperview];
        }
    }
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, header.height - 1, header.width - 15, 0.5)];
    line.tag = lineTag;
    line.backgroundColor = KLine_Color;
    [header addSubview:line];
    
    if (tableView == self.tableView) {
        [self leftMenuConfigration];
    }
}
// 向上滑（滑动到上面的时候要算一下）包括刚出现
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (tableView == self.tableView) {
        [self leftMenuConfigration];
    }
}

// 右边滑动的时候，左边设置下点击状态
- (void)leftMenuConfigration {
    // 判断，如果是左边点击触发的滚动，这不执行下面代码
    if (self.isSelected) {
        return;
    }
    // 获取可见视图的第一个row
    NSInteger currentSection = [[[self.tableView indexPathsForVisibleRows] firstObject] section];
    NSIndexPath *index = [NSIndexPath indexPathForRow:currentSection inSection:0];
    // 点击左边对应区块
    [self.leftMenuList selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionTop];
}

// 开始拖动赋值没有点击
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // 当右边视图将要开始拖动时，则认为没有被点击了。
    self.isSelected = NO;
}

#pragma matk - 按钮点击事件收藏板块
- (void)collectAction:(DZCollectButton *)btn andModel:(DZBaseForumModel *)model {
    
    if(![self isLogin]) {
        return;
    }
    
    if (btn.lighted) {// 收藏
        [ForumTool DZ_CollectionForum:model.fid success:^{
            btn.lighted = NO;
            model.favorited = @"1";
        } failure:nil];
    } else {//取消
        [ForumTool DZ_DeleCollection:model.fid type:collectForum success:^{
            btn.lighted = YES;
            model.favorited = @"0";
        } failure:nil];
    }
}

#pragma mark - setter getter
- (DZBaseTableView *)leftMenuList {
    if (_leftMenuList == nil) {
        _leftMenuList = [[DZBaseTableView alloc] initWithFrame:CGRectMake(0, KNavi_ContainStatusBar_Height, KScreenWidth * 0.22, KScreenHeight - KNavi_ContainStatusBar_Height-KTabbar_Height) style:UITableViewStylePlain];
        _leftMenuList.delegate = self;
        _leftMenuList.dataSource = self;
        _leftMenuList.backgroundColor = KLightLine_Color;
        _leftMenuList.tableFooterView = [[UIView alloc] init];
        _leftMenuList.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _leftMenuList;
}

@end
