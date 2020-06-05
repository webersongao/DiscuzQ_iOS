//
//  DZFavoriteThreadController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteThreadController.h"
#import "CollectionViewCell.h"

@interface DZFavoriteThreadController ()

@end

@implementation DZFavoriteThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downLoadMyFavThread];
    KWEAKSELF;
    
    self.tableView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadMyFavThread];
    }];
    [self.view addSubview:self.tableView];
    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
}

// 收藏帖子
-(void)downLoadMyFavThread{
    
    
}

- (void)mj_endRefreshing {
    if (self.page == 1) {
        [self.tableView.mj_header endRefreshing];
    } else {
        [self.tableView.mj_footer endRefreshing];
    }
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75.0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellId = @"CellIdtow";
    CollectionViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[CollectionViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
    }
    
    
    NSDictionary * dic = [self.dataSourceArr objectAtIndex:indexPath.row];
    if ([DataCheck isValidDict:dic]) {
        [cell setData:dic];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tidStr = [[self.dataSourceArr objectAtIndex:indexPath.row]objectForKey:@"id"];
    [[DZMobileCtrl sharedCtrl] PushToThreadDetailController:tidStr];
}




@end
