//
//  DZShadowAlertManager.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/9/27.
//

#import "DZShadowAlertManager.h"

@interface DZShadowAlertManager ()
{
//     DZScaleView *shadowScaleView;
     BOOL bTouchDismiss;
}
@property(nonatomic,strong) UIView *backContainerView;
@property(nonatomic,weak) DZScaleView *shadowScaleView;

@end

static DZShadowAlertManager *instance = nil;

@implementation DZShadowAlertManager

+ (instancetype)sharedManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupContainerView];
    }
    return self;
}

-(void)setupContainerView{
    bTouchDismiss = YES;
    self.backContainerView = [[UIView alloc] initWithFrame:KScreenBounds];
    self.backContainerView.tag = KShadowAlert_Tag;
    self.backContainerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackContainerViewAction:)];
    [self.backContainerView addGestureRecognizer:tapges];
}

/**
 展示弹窗

 @param alertView 需要展示的弹窗
 @param bDisdimiss 点击 弹窗外部的空白区域 是否关闭弹窗
 */
-(void)showScaleAlertView:(DZScaleView *)alertView bDismiss:(BOOL)bDisdimiss{
    
    // 1、数据重置
    if (alertView) {
        [self setupContainerView];
    }else{
        return;
    }
    
    // 2、展示view
    bTouchDismiss = bDisdimiss;
   self.shadowScaleView = alertView;
    if (self.shadowScaleView.origin.x == 0) {
        self.shadowScaleView.center = CGPointMake(self.backContainerView.width/2.f, self.backContainerView.height/2.f);
    }
    [self.backContainerView addSubview:_shadowScaleView];
    _shadowScaleView.transform = CGAffineTransformMakeScale(0.6, 0.6);
    
    self.backContainerView.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.backContainerView.alpha = 1;
    }];
    KWEAKSELF
    [UIView animateWithDuration:1.5f
                          delay:0.0f
         usingSpringWithDamping:0.5f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         weakSelf.shadowScaleView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                        KSLog(@"Animation End");
                     }];
    UIWindow *mainWindow =  [UIApplication sharedApplication].keyWindow;
    [[mainWindow viewWithTag:KShadowAlert_Tag] removeFromSuperview];
    [mainWindow addSubview:self.backContainerView];
    [mainWindow bringSubviewToFront:self.backContainerView];
    
}


/**
 移除弹窗 
 */
-(void)dismissScaleAlertView{
   
    KWEAKSELF
    [UIView animateWithDuration:0.25 animations:^{
        self.backContainerView.alpha = 0.3;
        weakSelf.shadowScaleView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        //移除View
        if (weakSelf.shadowScaleView.dismissBlock) {
            weakSelf.shadowScaleView.dismissBlock();
        }
        [weakSelf.shadowScaleView removeFromSuperview];
        [self.backContainerView removeFromSuperview];
        self.backContainerView= nil;
    }];
}


// 手势处理
-(void)tapBackContainerViewAction:(UITapGestureRecognizer *)tapGes{
    
    CGPoint tapPoint = [tapGes locationInView:self.backContainerView];
    if (CGRectContainsPoint(_shadowScaleView.frame, tapPoint)) {
        //返回事件
        if (_shadowScaleView.touchAlertblock) {
            _shadowScaleView.touchAlertblock(tapPoint);
        }
    } else {
        if (bTouchDismiss) {
            [self dismissScaleAlertView];
        }
    }
}




@end
