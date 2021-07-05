//
//  TBLodingView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

// 三色球旋转加载动画

#import <UIKit/UIKit.h>
#import "SRDefine.h"

typedef enum {
    LoadingStateNormal,
    LoadingStateShortening,
    LoadingStateMiss
} LoadingState;

typedef enum{
    leftBall,
    midBall,
    rightBall
} BallType;

#define VIEW_HUB_Width 260 //60

@interface DZLoadingView : UIView
{
    BOOL _bUseImageView;//是否使用序列帧动画
    BOOL _bUseSingleImage;//是否使用单张图片旋转
    NSMutableArray* _fileArr;
}

- (id)initWithDefaultFrame;
- (id)initWithImageViewByImage:(UIImage*)image;
- (id)initWithActImageView;
- (id)initWithFrame:(CGRect)frame bSlime:(BOOL)bSlime;

- (void)setBallsLeftColor:(UIColor*)leftColor MidColor:(UIColor*)midcolor RightColor:(UIColor*)rightColor;
- (void)setPlayDuration:(CGFloat)duration AndDelay:(CGFloat)delay;
- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;
- (void)reStartAnimating;

- (void)aPartBalls:(CGFloat)distans;
- (void)willBeginAction;

@property (nonatomic, assign) CGPoint startPoint, toPoint;
@property (nonatomic, assign) CGFloat viscous;
@property (nonatomic, assign) LoadingState state;

@end



@interface NiHubView : UIView


- (void)ajustSubviews;
- (void)setText:(NSString *)text bHidden:(BOOL)bHideden;

@end

