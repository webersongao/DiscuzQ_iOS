//
//  DZSearchController.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/4/15.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZSearchController.h"
#import "SearchModel.h"
#import "DZSearchToolBar.h"
#import "DZSearchListCell.h"
#import "DZSearchHistoryController.h"
#import "UIAlertController+Extension.h"

@interface DZSearchController ()<UISearchBarDelegate>

@property (nonatomic, strong) DZSearchToolBar *searchView;
@property (nonatomic, strong) DZSearchHistoryController *historyVC;

@end

@implementation DZSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_searchCtrlView];
    [self config_searchCtrlAction];
}

#pragma mark - 布局
- (void)config_searchCtrlView {
    
    [self.view addSubview:self.tableView];
    [self dz_SetNavigationTitleView:self.searchView];
    [self.searchView.searchBar becomeFirstResponder];
    
    self.tableView.backgroundColor = KWhite_Color;
    [self.tableView registerClass:[DZSearchListCell class] forCellReuseIdentifier:@"DZSearchListCell"];
    [self.searchView.rightBtn addTarget:self action:@selector(rightSearchBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)config_searchCtrlAction {
    
    KWEAKSELF
    self.historyVC.SearchClick = ^(NSString *searchText) {
        weakSelf.searchView.searchBar.text = searchText;
        [weakSelf searchBarEndActive];
        [weakSelf clickSearch:searchText];
    };
    
    self.historyVC.ScrollWillDrag = ^{
        [weakSelf searchBarEndActive];
    };
    
    self.tableView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf requestSearchData];
    }];
}

- (void)rightSearchBarBtnClick:(UIButton *)button {
    button.selected = !button.isSelected;
    if (button.isSelected) {
        [self searchBarEndActive];
        [self clickSearch:self.searchView.searchBar.text];
    }else{
        [self.searchView.searchBar resignFirstResponder];
    }
}


#pragma mark - UITableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DZSearchListCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"DZSearchListCell" forIndexPath:indexPath];
    SearchModel *model = self.dataSourceArr[indexPath.row];
    [listCell updateSearchCell:model];
    return listCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.dataSourceArr.count <= indexPath.row) {
        return;
    }
    SearchModel *model = self.dataSourceArr[indexPath.row];
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:model.tid];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = KWhite_Color;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, KScreenWidth - 20, 39)];
    lab.textColor = [UIColor darkGrayColor];
    lab.font = [UIFont systemFontOfSize:14.0];
    lab.textAlignment = NSTextAlignmentLeft;
    UIView *lineView  = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lab.frame), KScreenWidth - 15, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    if (section == 0) {
        lab.text = @"相关帖子";
    } else {
        lab.text = @"";
    }
    [view addSubview:lab];
    [view addSubview:lineView];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return (kMargin30 + kMargin10);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.cellHeightDict[indexPath]) {
        self.cellHeightDict[indexPath] = @([self caculateSearchCellHeight:indexPath]);
    }
    return [self.cellHeightDict[indexPath] floatValue];
}

- (CGFloat)caculateSearchCellHeight:(NSIndexPath *)indexPath {
    SearchModel *model = self.dataSourceArr[indexPath.row];
    DZSearchListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DZSearchListCell"];
    return [cell caculateSearchCellHeight:model];
}

// 右Button响应
- (void)rightBarButtonItemAction:(UIBarButtonItem *)sender {
    [self.searchView.searchBar resignFirstResponder];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
}

#pragma mark - 搜索响应事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchBarEndActive];
    if (![DataCheck isValidString:searchBar.text]) {
        [UIAlertController alertTitle:@"提示" message:@"请输入关键字" controller:self doneText:@"确定" cancelText:nil doneHandle:nil cancelHandle:nil];
        return;
    }
    
    [self clickSearch:searchBar.text];
}

- (void)clickSearch:(NSString *)searchText {
    if (!searchText.length) {
        return;
    }
    self.historyVC.view.hidden = YES;
    [self.historyVC saveSearchHistory:searchText];
    self.historyVC.view.hidden = YES;
    
    if (self.dataSourceArr.count > 0) {
        self.dataSourceArr = [NSMutableArray array];
        [self.cellHeightDict removeAllObjects];
    }
    [self.tableView reloadData];
    self.tableView.contentOffset = CGPointZero;
    self.page = 1;
    [self requestSearchData];
}


- (void)requestSearchData {
    if (!self.dataSourceArr.count) {
        [self.HUD showLoadingMessag:@"搜索中" toView:self.view];
    }
    
    NSString *keyStr = self.searchView.searchBar.text;
    KWEAKSELF
    
//    [[DZNetCenter center] dzx_siteSearcWithKey:keyStr page:self.page completion:^(id  _Nonnull varModel, BOOL success) {
//        [weakSelf.tableView.mj_footer endRefreshing];
//        if (success) {
//            [self.tableView reloadData];
//        }else{
//            [self searchBarBecomeActive];
//        }
//    }];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchView.searchBar endEditing:YES];
}

- (void)searchBarBecomeActive {
    [self.searchView.searchBar becomeFirstResponder];
}
- (void)searchBarEndActive {
    [self.searchView.searchBar endEditing:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self searchBarEndActive];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (![DataCheck isValidString:searchText]) {
        self.historyVC.view.hidden = NO;
        if (self.dataSourceArr.count > 0) {
            self.dataSourceArr = [NSMutableArray array];
            [self.cellHeightDict removeAllObjects];
            [self.tableView reloadData];
        }
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
}

- (DZSearchHistoryController *)historyVC {
    if (_historyVC == nil) {
        _historyVC = [[DZSearchHistoryController alloc] init];
        [self.view addSubview:_historyVC.view];
        [self addChildViewController:_historyVC];
    }
    return _historyVC;
}

-(DZSearchToolBar *)searchView{
    if (!_searchView) {
        _searchView = [[DZSearchToolBar alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-((kMargin15 * 2.f)+kMargin30), kToolBarHeight)];
        _searchView.searchBar.delegate = self;
    }
    return _searchView;
}

@end
