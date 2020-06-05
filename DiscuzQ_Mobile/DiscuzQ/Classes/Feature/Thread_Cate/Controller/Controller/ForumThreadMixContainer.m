//
//  ForumThreadMixContainer.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "ForumThreadMixContainer.h"
#import "DZThreadCateListController.h"
#import "ForumListBaseCtrl.h"

@interface ForumThreadMixContainer () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation ForumThreadMixContainer

- (void)setParentControl:(UIViewController *)parentController {
    self.parentController = parentController;
    DZThreadCateListController *bdVC = (DZThreadCateListController *)self.parentController;
    [bdVC addChildViewController:self];
    [bdVC.contentView addSubview:self.view];
}

#pragma mark - collectionView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tableControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *view = [self.tableControllers[indexPath.item] view];
    [cell.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 0, -5, 0));
    }];
    return cell;
}

- (void)setChildCanScroll:(BOOL)childCanScroll {
    //修改所有的子控制器的状态
    for (ForumListBaseCtrl *ctrl in self.tableControllers) {
        ctrl.canScroll = childCanScroll;
    }
}

#pragma mark - collectionView delegate
// 这里覆盖了父类的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self.segmentControl  setSelectedSegmentIndex:index];
    
    [(DZThreadCateListController *)self.parentController setSelectIndex:index];
    if (self.selectIndex != index) {
        self.selectIndex = index;
        // 延迟0.03秒执行 为了界面滑动流畅啊！！！！
        [self performSelector:@selector(threadListFirstRequest) withObject:nil afterDelay:0.03];
    }
}

// 通知方法
- (void)threadListFirstRequest {
    [[NSNotificationCenter defaultCenter] postNotificationName:DZ_ThreadListFirstReload_Notify object:nil userInfo:@{@"selectIndex":[NSNumber numberWithInteger:self.selectIndex]}];
}

// 防止拖动collection的时候，tableview乱动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [(DZThreadCateListController *)self.parentController setScrollEnable:NO];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    [(DZThreadCateListController *)self.parentController setScrollEnable:YES];
}

@end





