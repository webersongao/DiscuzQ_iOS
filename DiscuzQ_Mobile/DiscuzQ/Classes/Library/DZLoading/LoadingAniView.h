//
//  LoadingAniView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PRLoadingViewType) {
    PRLoadingViewNoramlType, //不覆盖
    PRLoadingViewCoverlayType, //覆盖.合成封面生成图片获取ndl的时候的一个类型
};


@interface LoadingAniView : UIView


+(LoadingAniView *)sharedView;

/**
 立即执行 不覆盖的动画
 */
- (void)startLoadingWithSuperView:(UIView* )superView;

/**
 立即执行 覆盖的动画
 */
- (void)startCoverLoadingWithSuperView:(UIView *)superView;


/**
 垂直  Y  方向偏移量 相对于superView
 */
- (void)setLoadingVerCenterOffset:(CGFloat)offset;

- (void)stopLoadingView;

-(void)startLoadingView;


/********************* 以下: 非单例写法 *************************/


- (id)initWithSuperView:(UIView *)sperView loadingType:(PRLoadingViewType)loadingType;

- (void)startAnimationViewWithSuperView:(UIView *)superView;

//立即执行动画
- (void)startAnimationViewWithOutDelayWithSuperView:(UIView *)superView;

- (void)stopAnimationView;

- (void)restartAnimationView;

@end
