//
//  DZShadowView.mm
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/29.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZShadowView.h"

const CGFloat PRShadowAnimationDuration = 0.4f;

@interface DZShadowView ()
{
    CGRect m_topViewRc;
    BOOL m_supportOrientation;
    ShadowAlertAnimationType m_animationType;
}
@end

@implementation DZShadowView

@synthesize topView = m_topView;
@synthesize bCloseWhenRotate = m_bCloseWhenRotate;
@synthesize bCloseByTap = m_bCloseByTap;
@synthesize bPRCustomAlertView = m_bPRCustomAlertView;
@synthesize bBottom = m_bBottom;


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self initDataWithColor:nil animationType:ShadowAlertAnimationNone];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertAnimationType)animationType
{
    if ((self = [super initWithFrame:frame])) {
        [self initDataWithColor:color animationType:animationType];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertAnimationType)animationType bGUIShadowView:(BOOL)bGUIShadow
{
    if ((self = [super initWithFrame:frame])) {
        [self initDataWithColor:color animationType:animationType];
    }
    if (bGUIShadow) {
        if ([DZMobileCtrl sharedCtrl].shadowAlertView)
        {
            [[DZMobileCtrl sharedCtrl].shadowAlertView closeAlertView];
        }
        [DZMobileCtrl sharedCtrl].shadowAlertView = self;
    }
    
    return self;
}

- (void)initDataWithColor:(UIColor *)color animationType:(ShadowAlertAnimationType)animationType
{
    m_topViewRc = CGRectZero;
    m_bCloseWhenRotate = NO;
    m_bCloseByTap = YES;
    m_bBottom = YES;
    self.tag = KShadowAlert_Tag;
    m_animationType = animationType;
    
    if (!color) {
        color = KColor(K000000_Color, 0.6);
    }
    
    if (animationType == ShadowAlertAnimationOutDefine) {
        [self coverView];
    }
    
    self.backgroundColor = color;
}

- (void)coverView
{
    UIView  *coverView = [[UIView alloc] initWithFrame:self.bounds];
    coverView.backgroundColor = mRGBColor_alpha(5, 0, 10, 0.55);
    [self addSubview:coverView];
}


- (void)onlySetTheTopView:(UIView*)view
{
    if (self.topView != view)
    {
        if (self.topView && [self.topView superview])
        {
            [self.topView removeFromSuperview];
        }
        self.topView = view;
        [self addSubview:self.topView];
        m_topViewRc = view.frame;
    }
    
    [self showAlert];
}

- (void)setTheTopView:(UIView*)view
{
    [self setTheTopView:view supportOrientation:NO];
}

- (void)setTheTopView:(UIView*)view supportOrientation:(BOOL)support
{
    m_supportOrientation = support;
    
    [self onlySetTheTopView:view];
    
    if (m_supportOrientation)
    {
        [self doSupportOrientation];
    }
    
}

- (void)orientationPosition
{
    
    if (self.bCloseWhenRotate)
    {
        if (self.bPRCustomAlertView)
        {
            [self closeAlertView];
        }
        else
        {
            if ([DZMobileCtrl sharedCtrl].shadowAlertView)
            {
                [[DZMobileCtrl sharedCtrl].shadowAlertView closeAlertView];
                [DZMobileCtrl sharedCtrl].shadowAlertView = nil;
            }
        }
        
        return;
    }
    
    if (m_supportOrientation)
    {
        [self doSupportOrientation];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UIDeviceOrientationDidChangeNotification" object:nil];
    
}

- (void)doSupportOrientation
{
    {
        BOOL bLandSpace = NO;
        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (statusBarOrientation)
        {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                bLandSpace = NO;
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
            {
                bLandSpace = YES;
            }
                break;
                
            default:
                break;
        }
        
        BOOL isNonePurches  = YES;
        
        CGRect rcTopView = self.topView.frame;
        
        if (isNonePurches) {
            if (m_bBottom)
            {
                if (bLandSpace)
                {
                    rcTopView = CGRectMake(0,KScreenBounds.size.width-rcTopView.size.height,KScreenBounds.size.height,rcTopView.size.height);
                }
                else
                {
                    rcTopView = CGRectMake(0,KScreenBounds.size.height-rcTopView.size.height,KScreenBounds.size.width,rcTopView.size.height);
                    
                }
            }
            else
            {
                if (bLandSpace)
                {
                    rcTopView = CGRectMake((KScreenBounds.size.height-rcTopView.size.width)/2,(KScreenBounds.size.width-rcTopView.size.height)/2,rcTopView.size.width,rcTopView.size.height);
                    
                }
                else
                {
                    rcTopView = CGRectMake((KScreenBounds.size.width-rcTopView.size.width)/2,(KScreenBounds.size.height-rcTopView.size.height)/2,rcTopView.size.width,rcTopView.size.height);
                }
            }
            self.topView.frame = rcTopView;
            
        }
        
        m_topViewRc = rcTopView;
    }
    
    {
        
        int screen_h = KScreenHeight;
        int screen_w = KScreenWidth;
        int tip_h = KScreenHeight;
        int tip_w = KScreenWidth;
        
        CGRect bounds = CGRectMake(0, 0, tip_w, tip_h);
        CGPoint center = CGPointMake(screen_w/2.0, screen_h/2.0);
        CGAffineTransform trans = CGAffineTransformMakeRotation(0);
        
        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (statusBarOrientation)
        {
            case UIInterfaceOrientationPortrait:
            {
                //
                bounds = CGRectMake(0, 0, tip_w, tip_h);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                trans = CGAffineTransformMakeRotation(0);
                
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:
            {
                bounds = CGRectMake(0, 0, tip_h, tip_w);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                
                trans = CGAffineTransformMakeRotation(M_PI_2*3);
            }
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                bounds = CGRectMake(0, 0, tip_w, tip_h);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                trans = CGAffineTransformMakeRotation(M_PI);
            }
                break;
            case UIInterfaceOrientationLandscapeRight:
            {
                
                bounds = CGRectMake(0, 0, tip_h, tip_w);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                
                
                trans = CGAffineTransformMakeRotation(M_PI_2);
            }
                break;
                
            default:
                break;
        }
        self.transform = trans;
        self.bounds = bounds;
        self.center = center;
    }
}


- (void)hiddenAlertView:(BOOL)bHidden
{
    self.hidden = bHidden;
}
- (void)closeAlertView
{
    if ([m_topView respondsToSelector:@selector(closeView)])
    {
        [m_topView performSelector:@selector(closeView)];
    }
    
    if (self.bPRCustomAlertView)
    {
        
    }
    else
    {
        [DZMobileCtrl sharedCtrl].shadowAlertView = nil;
    }
    
    [self  hideAlertWithCompletion:^{
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    m_topViewRc = self.topView.frame;
    if(!CGRectContainsPoint(m_topViewRc,pt))
    {
        if (m_bCloseByTap)
        {
            [self closeAlertViewWithAnimated];
        }
    }
    
    [super touchesBegan:touches withEvent:event];
}

- (void)closeAlertViewWithAnimated
{
    if ([m_topView respondsToSelector:@selector(closeViewWithAnimated)])
    {
        [m_topView performSelector:@selector(closeViewWithAnimated)];
    }
    else
    {
        [self closeAlertView];
    }
}

- (void)showShadowAlertViewToKeyWindow{
    UIWindow *mainView =  [UIApplication sharedApplication].keyWindow;
    if (mainView)
    {
        [mainView addSubview:(UIView *)self];
    }
}

#pragma mark -- 6.90
- (void)showAlert{
    
    if (!self.topView) {
        return;
    }
    
    if (m_animationType == ShadowAlertAnimationNone || m_animationType == ShadowAlertAnimationOutDefine) {
        return;
    }
    
    self.alpha = 0;
    
    if (m_animationType == ShadowAlertAnimationFromUp) {
        CGFloat orginY = self.topView.top;
        self.topView.bottom = orginY;
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.top = orginY;
        }];
    } else if (m_animationType == ShadowAlertAnimationFromDown) {
        CGFloat orginY = self.topView.bottom;
        self.topView.top = orginY;
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.bottom = orginY;
        }];
    } else if (m_animationType == ShadowAlertAnimationFromRight) {
        CGFloat right =  self.topView.right;
        self.topView.left = right;
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.right = right;
        }];
    }
}

- (void)hideAlertWithCompletion:(void(^)(void))completion{
    
    if (m_animationType == ShadowAlertAnimationNone || m_animationType == ShadowAlertAnimationOutDefine) {
        [self removeFromSuperview];
        return;
    }
    
    if (m_animationType == ShadowAlertAnimationFromUp) {
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.bottom = self.topView.top;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else if (m_animationType == ShadowAlertAnimationFromDown){
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.top = self.topView.bottom;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else if (m_animationType == ShadowAlertAnimationFromRight){
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.left = self.topView.right;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {
        
        [self removeFromSuperview];
    }
    
}

@end
