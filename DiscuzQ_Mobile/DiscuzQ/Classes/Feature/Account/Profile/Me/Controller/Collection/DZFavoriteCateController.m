//
//  DZFavoriteCateController.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZFavoriteCateController.h"
#import "UIAlertController+Extension.h"
#import "CollectionForumCell.h"

@interface DZFavoriteCateController ()

@end

@implementation DZFavoriteCateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.HUD showLoadingMessag:@"正在加载" toView:self.view];
    [self downLoadFavForumData];
    
    KWEAKSELF;
    self.tableView.mj_footer = [DZRefreshFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf downLoadFavForumData];
    }];
    [self.view addSubview:self.tableView];
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
    
    return 60.0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CollectForum = @"CollectForum";
    CollectionForumCell *forumCell = [tableView dequeueReusableCellWithIdentifier:CollectForum];
    if (forumCell == nil) {
        forumCell = [[CollectionForumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CollectForum];
    }
    NSDictionary *dic = [self.dataSourceArr objectAtIndex:indexPath.row];
    forumCell.textLab.text = [dic stringForKey:@"title"];
    
    return forumCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *forumId = [[self.dataSourceArr objectAtIndex:indexPath.row]objectForKey:@"id"];
    [[DZMobileCtrl sharedCtrl] PushToForumCateController:forumId];
}



-(void)downLoadFavForumData {
    

    
}


@end
