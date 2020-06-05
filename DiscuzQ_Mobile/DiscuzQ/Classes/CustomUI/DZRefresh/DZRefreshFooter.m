//
//  DZRefreshFooter.m
//  DiscuzQ
//
//  Created by Perfect on 2018/3/31.
//

#import "DZRefreshFooter.h"

static const CGFloat kRefreshFooterH = 50;

#define MJRefreshStateError 6

@implementation DZRefreshFooter

- (void)prepare
{
    [super prepare];
    self.stateLabel.textColor = KColor(@"#C4C7CE", 1.0);
    self.stateLabel.font = [UIFont systemFontOfSize:14];
    
    [self setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"努力加载中" forState:MJRefreshStateRefreshing];
    [self setTitle:@"我是有底线的~" forState:MJRefreshStateNoMoreData];
    [self setTitle:@"加载失败，请稍后再试" forState:MJRefreshStateError];
    
    self.mj_h = kRefreshFooterH;
}

- (void)showErrorState
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.state = MJRefreshStateError;
        UIActivityIndicatorView *loadingView = [self performSelector:@selector(loadingView)];
        if (loadingView.isAnimating) {
            [loadingView stopAnimating];
        }
    });
}

- (void)stateLabelClick
{
    if (self.state == MJRefreshStateError || self.state == MJRefreshStateIdle) {
        [self beginRefreshing];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
    if (self.state != MJRefreshStateIdle) {
        return;
    }
    
    if (self.preLoadRatio <= 0 || self.preLoadRatio > 1) {
        return;
    }
    
    if (self.hidden || self.isRefreshing) {
        return;
    }
    
    CGFloat offset = (self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
    CGFloat rate = 0;
    if (offset > 0) {
        rate = (self.scrollView.contentOffset.y + self.scrollView.contentInset.top) / offset;
    }
    if (rate > self.preLoadRatio) {
        [self beginRefreshing];
    }
}

@end
