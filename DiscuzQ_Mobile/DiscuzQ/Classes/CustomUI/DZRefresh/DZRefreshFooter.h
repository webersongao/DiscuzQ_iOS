//
//  DZRefreshFooter.h
//  DiscuzQ
//
//  Created by Perfect on 2018/3/31.
//

#import "MJRefresh.h"

@interface DZRefreshFooter : MJRefreshAutoNormalFooter

// 触发预加载比率
@property (nonatomic, assign) CGFloat preLoadRatio;

- (void)showErrorState;

@end
