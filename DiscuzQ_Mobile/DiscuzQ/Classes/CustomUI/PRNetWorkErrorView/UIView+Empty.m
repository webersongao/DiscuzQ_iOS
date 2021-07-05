//
//  UIView+Empty.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "UIView+Empty.h"
#import <objc/runtime.h>
#import "DZEmptyView.h"

#pragma mark - ------------------ UIView ------------------

@implementation UIView (Empty)

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

#pragma mark - Setter/Getter

static char kEmptyViewKey;
-(void)setDz_emptyView:(DZEmptyView *)dz_emptyView{
    if (dz_emptyView != self.dz_emptyView) {
        
        objc_setAssociatedObject(self, &kEmptyViewKey, dz_emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[DZEmptyView class]]) {
                [view removeFromSuperview];
            }
        }
        [self addSubview:self.dz_emptyView];
        
        if ([self isKindOfClass:[UITableView class]] || [self isKindOfClass:[UICollectionView class]]) {
            [self getDataAndSet]; // 添加时根据DataSource去决定显隐
        } else {
            self.dz_emptyView.hidden = YES;// 添加时默认隐藏
        }
    }
}
- (DZEmptyView *)dz_emptyView{
    return  objc_getAssociatedObject(self, &kEmptyViewKey);
}

#pragma mark - Private Method (UITableView、UICollectionView有效)
- (NSInteger)totalDataCount
{
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        
        for (NSInteger section = 0; section < tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
        
        if (tableView.tableHeaderView || tableView.tableFooterView) {
            totalCount += 1;
        }
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        
        for (NSInteger section = 0; section < collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    
    return totalCount;
}

- (void)getDataAndSet{
    //没有设置emptyView的，直接返回
    if (!self.dz_emptyView) {
        return;
    }
    
    if ([self totalDataCount] == 0) {
        [self show];
    }else{
        [self hide];
    }
}
- (void)show{
    //当不自动显隐时，内部自动调用show方法时也不要去显示，要显示的话只有手动去调用 dz_showEmptyView
    if (!self.dz_emptyView.autoShowEmptyView) {
        return;
    }
    
    [self dz_showEmptyView];
}
- (void)hide{
    //当不自动显隐时，内部自动调用hide方法时也不要去隐藏，要隐藏的话只有手动去调用 dz_hideEmptyView
    if (!self.dz_emptyView.autoShowEmptyView) {
        return;
    }
    
    [self dz_hideEmptyView];
}

#pragma mark - Public Method
- (void)dz_showEmptyView{
    
    NSAssert(![self isKindOfClass:[DZEmptyView class]], @"DZEmptyView及其子类不能调用dz_showEmptyView方法");

    self.dz_emptyView.hidden = NO;
    
    //让 emptyBGView 始终保持在最上层
    [self bringSubviewToFront:self.dz_emptyView];
}
- (void)dz_hideEmptyView{
    NSAssert(![self isKindOfClass:[DZEmptyView class]], @"DZEmptyView及其子类不能调用dz_hideEmptyView方法");
    self.dz_emptyView.hidden = YES;
}
- (void)dz_startLoading{
    NSAssert(![self isKindOfClass:[DZEmptyView class]], @"DZEmptyView及其子类不能调用dz_startLoading方法");
    self.dz_emptyView.hidden = YES;
}
- (void)dz_endLoading{
    NSAssert(![self isKindOfClass:[DZEmptyView class]], @"DZEmptyView及其子类不能调用dz_endLoading方法");
    self.dz_emptyView.hidden = [self totalDataCount];
}

@end

#pragma mark - ------------------ UITableView ------------------

@implementation UITableView (Empty)
+ (void)load{
    
    [self exchangeInstanceMethod1:@selector(reloadData) method2:@selector(dzm_reloadData)];
    
    ///section
    [self exchangeInstanceMethod1:@selector(insertSections:withRowAnimation:) method2:@selector(dzm_insertSections:withRowAnimation:)];
    [self exchangeInstanceMethod1:@selector(deleteSections:withRowAnimation:) method2:@selector(dzm_deleteSections:withRowAnimation:)];
    [self exchangeInstanceMethod1:@selector(reloadSections:withRowAnimation:) method2:@selector(dzm_reloadSections:withRowAnimation:)];
    
    ///row
    [self exchangeInstanceMethod1:@selector(insertRowsAtIndexPaths:withRowAnimation:) method2:@selector(dzm_insertRowsAtIndexPaths:withRowAnimation:)];
    [self exchangeInstanceMethod1:@selector(deleteRowsAtIndexPaths:withRowAnimation:) method2:@selector(dzm_deleteRowsAtIndexPaths:withRowAnimation:)];
    [self exchangeInstanceMethod1:@selector(reloadRowsAtIndexPaths:withRowAnimation:) method2:@selector(dzm_reloadRowsAtIndexPaths:withRowAnimation:)];
}
- (void)dzm_reloadData{
    [self dzm_reloadData];
    [self getDataAndSet];
}
///section
- (void)dzm_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)dzm_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_deleteSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)dzm_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_reloadSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}

///row
- (void)dzm_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)dzm_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)dzm_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self dzm_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}


@end

#pragma mark - ------------------ UICollectionView ------------------

@implementation UICollectionView (Empty)

+ (void)load{
    
    [self exchangeInstanceMethod1:@selector(reloadData) method2:@selector(dzm_reloadData)];
    
    ///section
    [self exchangeInstanceMethod1:@selector(insertSections:) method2:@selector(dzm_insertSections:)];
    [self exchangeInstanceMethod1:@selector(deleteSections:) method2:@selector(dzm_deleteSections:)];
    [self exchangeInstanceMethod1:@selector(reloadSections:) method2:@selector(dzm_reloadSections:)];
    
    ///item
    [self exchangeInstanceMethod1:@selector(insertItemsAtIndexPaths:) method2:@selector(dzm_insertItemsAtIndexPaths:)];
    [self exchangeInstanceMethod1:@selector(deleteItemsAtIndexPaths:) method2:@selector(dzm_deleteItemsAtIndexPaths:)];
    [self exchangeInstanceMethod1:@selector(reloadItemsAtIndexPaths:) method2:@selector(dzm_reloadItemsAtIndexPaths:)];
    
}
- (void)dzm_reloadData{
    [self dzm_reloadData];
    [self getDataAndSet];
}
///section
- (void)dzm_insertSections:(NSIndexSet *)sections{
    [self dzm_insertSections:sections];
    [self getDataAndSet];
}
- (void)dzm_deleteSections:(NSIndexSet *)sections{
    [self dzm_deleteSections:sections];
    [self getDataAndSet];
}
- (void)dzm_reloadSections:(NSIndexSet *)sections{
    [self dzm_reloadSections:sections];
    [self getDataAndSet];
}

///item
- (void)dzm_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self dzm_insertItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
- (void)dzm_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self dzm_deleteItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
- (void)dzm_reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self dzm_reloadItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}

@end

