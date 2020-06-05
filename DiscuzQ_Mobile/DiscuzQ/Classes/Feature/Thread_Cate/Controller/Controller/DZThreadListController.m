//
//  DZThreadListController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import "DZThreadListController.h"
#import "UIAlertController+Extension.h"
#import "DZThreadListModel.h"
#import "DZThreadListModel+Display.h"
#import "DZShareCenter.h"
#import "DZThreadResModel.h"
#import "DZThreadListCell.h"

@interface DZThreadListController ()

@property (nonatomic, copy) NSString *fid;
@property (nonatomic, assign) NSInteger order;

@property (nonatomic, assign) DZ_ListType listType;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray *allArray;  //!< 属性注释
@property (nonatomic, assign) NSInteger notThisFidCount;
@property (nonatomic ,strong) DZThreadVarModel *VarModel;  //  数据
@end

@implementation DZThreadListController

- (instancetype)initWithType:(DZ_ListType)listType fid:(NSString *)fid order:(NSInteger)order
{
    self = [super init];
    if (self) {
        self.fid = fid;
        self.order = order;
        self.listType = listType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    [self inittableView];
    self.notThisFidCount = 0;
    [self loadThreadDataCache];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstThreadListRequest:) name:DZ_ThreadListFirstReload_Notify object:nil];
}


-(void)inittableView {
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[DZThreadListCell class] forCellReuseIdentifier:@"DZThreadListCell"];
    self.tableView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        if (self.VarModel.forum) {
            NSInteger threadsCount = self.VarModel.forum.threadcount + self.notThisFidCount;
            if (threadsCount > self.allArray.count) {
                self.page ++;
                [self downLoadCateListData:self.page];
            } else {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        } else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
    //    ((MJRefreshAutoFooter *)self.tableView.mj_footer).triggerAutomaticallyRefreshPercent = -20;
}

- (void)refreshThreadListData {
    self.page = 1;
    [self.tableView.mj_footer resetNoMoreData];
    [self downLoadCateListData:self.page];
}

- (void)loadThreadDataCache { // 读取缓存
    [self.HUD showLoadingMessag:@"正在刷新" toView:self.view];
    if (self.listType == DZ_ListAll) {
        [self downLoadCateListData:self.page];
    } else {
        [self downLoadCateListData:self.page];
    }
}


#pragma mark - 数据下载
- (void)downLoadCateListData:(NSInteger)page {
    
    
}

- (void)clearDatasource {
    self.notThisFidCount = 0;
    [self.allArray removeAllObjects];;
    [self.dataSourceArr removeAllObjects];
    [self.cellHeightDict removeAllObjects];
}

- (void)firstThreadListRequest:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    if ([DataCheck isValidDict:userInfo]) {
        NSInteger index = [[userInfo objectForKey:@"selectIndex"] integerValue];
        if (index == self.order && !self.dataSourceArr.count) {
            [self loadThreadDataCache];
        }
    }
}

/// 分析处理数据
- (void)anylyeThreadListData:(DZThreadResModel *)responseObject {
    
    self.VarModel = responseObject.Variables;
    
    [self.VarModel updateVarModel:self.fid andPage:self.page handle:^(NSArray *topArr, NSArray *commonArr, NSArray *allArr, NSInteger notFourmCount) {
        if (self.page == 1) {
            self.notThisFidCount = notFourmCount;
            [self.dataSourceArr addObject:[NSArray arrayWithArray:topArr]];
            [self.dataSourceArr addObject:[NSArray arrayWithArray:commonArr]];
            self.allArray = [NSMutableArray arrayWithArray:allArr];
        } else {
            if (commonArr.count) {
                DZThreadListModel *model1 = commonArr.firstObject;
                NSMutableArray *commonListArr = [NSMutableArray arrayWithArray:self.dataSourceArr.lastObject];
                DZThreadListModel *model2 = commonListArr.lastObject;
                if ([model1.tid isEqualToString:model2.tid]) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                    return;
                }
                [commonListArr addObjectsFromArray:commonArr];
                if (self.dataSourceArr.count <= 0) {
                    [self.dataSourceArr addObject:[NSArray array]];
                }
                if (self.dataSourceArr.count <= 1) {
                    [self.dataSourceArr addObject:commonListArr];
                }else{
                    [self.dataSourceArr replaceObjectAtIndex:1 withObject:commonListArr];
                }
            }
            if (allArr.count) {
                [self.allArray addObjectsFromArray:allArr];
            }
        }
    }];
}

- (void)sendVariablesToMixcontroller {
    if (self.listType == DZ_ListAll) {
        if (self.dataBlockWhenAll) {
            self.dataBlockWhenAll(self.VarModel);
        }
    }
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSourceArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.section][indexPath.row];
    
    return listModel.listLayout.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *sectionArray = self.dataSourceArr[section];
    return sectionArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 5;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.section][indexPath.row];
    
    DZThreadListCell * listCell = [self.tableView dequeueReusableCellWithIdentifier:@"DZThreadListCell" forIndexPath:indexPath];
    
    //    [listCell updateThreadListCell:listModel];
    
    return listCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DZThreadListModel *listModel = self.dataSourceArr[indexPath.section][indexPath.row];
    
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:listModel.tid];
}

- (void)ToUserThreadSubjectController {
    [[DZMobileCtrl sharedCtrl] PushToMyThreadListController];
}



@end



