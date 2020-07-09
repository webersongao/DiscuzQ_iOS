//
//  DZLoadingAniView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZLoadingAniView.h"

#define  PRLoadingWidth 100/2

@interface DZLoadingAniView ()
{
    UIImageView *loadingImageView;
    PRLoadingViewType loadingViewType;
}
@end

@implementation DZLoadingAniView



+(DZLoadingAniView *)sharedView
{
    static DZLoadingAniView *tmpLoading = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tmpLoading = [[DZLoadingAniView alloc] initWithLoadingType:PRLoadingViewNoramlType];
    });
    return tmpLoading;
}


- (id)initWithLoadingType:(PRLoadingViewType)loadingType
{
    loadingType = loadingViewType;
    
    self = [super initWithFrame:CGRectMake(0, 0, PRLoadingWidth, PRLoadingWidth)];
    
    [self initSubLoaingView];
    
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

-(UIView *)checkLoadingSuperView:(UIView *)superView{
    
    if (loadingImageView.isAnimating) {
        [loadingImageView stopAnimating];
    }
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    UIView * tmpSuperView = superView;
    if (nil == tmpSuperView) {
        UIWindow *mainView = [UIApplication sharedApplication].keyWindow;
        if (mainView) {
            tmpSuperView = mainView;
        }else{
            tmpSuperView = nil;
        }
    }
    return tmpSuperView;
}

/**
 立即执行 不覆盖的动画
 */
- (void)startLoadingWithSuperView:(UIView *)superView{
    
    UIView * loadSuperView = [self checkLoadingSuperView:superView];
    if (nil == loadSuperView) {
        return;
    }
    
    [self setLoadingViewWithType:PRLoadingViewNoramlType SuperView:loadSuperView];
    [loadSuperView addSubview:self];
    
    [loadingImageView performSelector:@selector(startAnimating) withObject:nil afterDelay:0];
}

/**
 立即执行 覆盖的动画
 */
- (void)startCoverLoadingWithSuperView:(UIView *)superView{
    
    UIView * loadSuperView = [self checkLoadingSuperView:superView];
    if (nil == loadSuperView) {
        return;
    }
    
    [self setLoadingViewWithType:PRLoadingViewCoverlayType SuperView:loadSuperView];
    [loadSuperView addSubview:self];
    
    [loadingImageView performSelector:@selector(startAnimating) withObject:nil afterDelay:0];
}


-(void)setLoadingViewWithType:(PRLoadingViewType)loadingType SuperView:(UIView *)superView{
    CGRect rect;
    switch (loadingType) {
        case PRLoadingViewNoramlType:
            rect = CGRectMake((superView.width - PRLoadingWidth) / 2, (superView.height - PRLoadingWidth) / 2, PRLoadingWidth, PRLoadingWidth);
            break;
        case PRLoadingViewCoverlayType:
            rect = superView.bounds;
            break;
            
        default:
            
            break;
    }
    
    [self setFrame:rect];
}

/**
 垂直 Y 方向偏移量 相对于superView
 */
- (void)setLoadingVerCenterOffset:(CGFloat)offset{
    CGFloat tmpCenterY = offset + KScreenHeight/2.0;
    self.centerY = tmpCenterY;
}

- (void)stopLoadingView
{
    [loadingImageView stopAnimating];
    if (self.superview) {
        [self removeFromSuperview];
    }
}

-(void)startLoadingView{
    if (self.superview && loadingImageView != nil) {
        [loadingImageView startAnimating];
    }
}

/********************* 以下: 非单例写法 *************************/


- (id)initWithSuperView:(UIView *)superView loadingType:(PRLoadingViewType)loadingType
{
    CGRect rect;
    switch (loadingType) {
        case PRLoadingViewNoramlType:
            rect = CGRectMake((superView.width - PRLoadingWidth) / 2, (superView.height - PRLoadingWidth) / 2, PRLoadingWidth, PRLoadingWidth);
            break;
        case PRLoadingViewCoverlayType:
            rect = superView.bounds;
            break;
            
        default:
            
            break;
    }
    
    self = [super initWithFrame:rect];
    
    [self initSubLoaingView];
    
    self.backgroundColor = [UIColor clearColor];
    
    [superView addSubview:self];
    
    return self;
}

- (void)initSubLoaingView
{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backBecomeActive) name:@APPLICATION_DID_BECOME_ACTIVE object:nil];
    
    loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - PRLoadingWidth)/2, (self.height - PRLoadingWidth) / 2, PRLoadingWidth, PRLoadingWidth)];
    loadingImageView.animationDuration = 2;
    loadingImageView.animationRepeatCount = MAXFLOAT;
    loadingImageView.animationImages = [self imageArray];
    [loadingImageView stopAnimating];
    [self addSubview:loadingImageView];
}

- (NSMutableArray *)imageArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:25];
    for (int index = 1; index<=25; index++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_animation_%d",index];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    return array;
}

- (void)startAnimationViewWithSuperView:(UIView *)superView
{
    if (!self.superview) {
        [superView addSubview:self];
    }
    [loadingImageView performSelector:@selector(startAnimating) withObject:nil afterDelay:0.5];
    
}

- (void)startAnimationViewWithOutDelayWithSuperView:(UIView *)superView
{
    if (!self.superview) {
        [superView addSubview:self];
    }
    [loadingImageView performSelector:@selector(startAnimating) withObject:nil afterDelay:0];
    
}

- (void)stopAnimationView
{
    [loadingImageView stopAnimating];
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)restartAnimationView {
    [loadingImageView startAnimating];
}

#pragma mark -- notification backActive
- (void)backBecomeActive
{
    if (self.superview && loadingImageView.superview) {
        if (!loadingImageView.isAnimating) {
            [loadingImageView startAnimating];
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end








