//
//  PRRefreshHeader.m
//  DiscuzQ
//
//  Created by Perfect on 2018/3/30.
//

#import "DZRefreshHeader.h"

@interface DZRefreshHeader ()
@property (nonatomic, assign) DZRefreshHeaderMode pr_mode;  //!< 属性注释
@end

@implementation DZRefreshHeader

#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:7];
    for (NSInteger index = 1; index <= 7; index++) {
        NSString *imageName = [NSString stringWithFormat:@"refreshheader_%ld",(long)index];
        UIImage *headerloadingImg = [UIImage imageNamed:imageName];
        if (headerloadingImg) {
            [imageArray addObject:headerloadingImg];        
        }
    }
    [self setImages:imageArray forState:MJRefreshStateIdle];
    [self setImages:imageArray forState:MJRefreshStatePulling];
    [self setImages:imageArray forState:MJRefreshStateRefreshing];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.automaticallyChangeAlpha = YES;
    self.stateLabel.hidden = YES;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    self.gifView.frame = self.bounds;
}


- (void)checkRestartLoadingAnimation
{
    if (self.state == MJRefreshStateRefreshing && !self.gifView.isAnimating) {
        [self.gifView startAnimating];
    }
}

+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action mode:(DZRefreshHeaderMode)mode {
    DZRefreshHeader *cmp = [[self alloc] initWithMode:mode];
    cmp.pr_mode = mode;
    [cmp setRefreshingTarget:target refreshingAction:action];
    return cmp;
}

- (instancetype)initWithMode:(DZRefreshHeaderMode)mode {
    
    _pr_mode = mode;
    
    if (self = [super init]) {
        
    }
    return self;
}

@end
