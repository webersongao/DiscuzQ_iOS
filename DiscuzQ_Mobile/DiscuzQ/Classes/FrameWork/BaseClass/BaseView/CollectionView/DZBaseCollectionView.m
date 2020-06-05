//
//  DZBaseCollectionView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionView.h"
#import "DZRefreshHeader.h"
#import "DZRefreshFooter.h"

@interface DZBaseCollectionView ()

@end

@implementation DZBaseCollectionView

- (instancetype)initWithSquareFrame:(CGRect)frame
{
    self = [super initWithFrame:frame collectionViewLayout:[DZLayoutTool defaultLayout]];
    if (self) {
        [self layoutSubviewConfig];
        self.backgroundColor = KRandom_Color;
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    return self;
}

-(void)layoutSubviewConfig{

    [self addRefreshHeaderView];
    [self addRefreshFooterView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressRecognizerAction:)];
    [self addGestureRecognizer:longPress];
}

- (void)addRefreshHeaderView
{
    if (!self.mj_header) {
        KWEAKSELF
        self.mj_header = [DZRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf headerViewPullDownAction];
        }];
    }
}

- (void)addRefreshFooterView
{
    if (!self.mj_footer) {
        KWEAKSELF
        DZRefreshFooter *footer = [DZRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf footerViewPullUpAction];
        }];
        self.mj_footer = footer;
    }
}

-(void)setIsFooter:(BOOL)isFooter{
    _isFooter = isFooter;
    if (isFooter) {
        [self addRefreshFooterView];
    }else{
        self.mj_footer = nil;
    }
}

// 列表刷新
-(void)reloadCollectionListData{
    [self reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

-(void)lonePressRecognizerAction:(UILongPressGestureRecognizer *)longPressGes{
    
}

#pragma mark -- data refresh and more
/// 列表下拉刷新
-(void)headerViewPullDownAction{
    
    if (self.refreshAction) {
        self.refreshAction();
    }
}

/// 列表上拉加载更多
-(void)footerViewPullUpAction{

    if (self.loadMoreAction) {
        self.loadMoreAction();
    }
}

- (void)refreshBookEnd:(DZRefreshState)state
{
    KWEAKSELF
    [self.mj_header endRefreshingWithCompletionBlock:^{
        if (state == DZRefreshStateSuccess) {
            [weakSelf addRefreshFooterView];
            weakSelf.mj_footer.hidden = NO;
        }
    }];
}

- (void)loadMoreBookEnd:(DZRefreshState)state
{
    KWEAKSELF
    [self.mj_footer endRefreshingWithCompletionBlock:^{
        if (state == DZRefreshStateDataFinish) {
            weakSelf.mj_footer.hidden = YES;
        }
    }];
}

#pragma mark   /********************* 初始化控件 *************************/




@end
