//
//  DZMobileCtrl+HubView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+HubView.h"
#import "DZLoadingAniView.h"

@interface DZMobileCtrl ()

@property (nonatomic, assign) BOOL bOpenLoadAnimated;  //!< <#属性注释#>

@end

@implementation DZMobileCtrl (HubView)


-(void)setBOpenLoadAnimated:(BOOL)bOpenLoadAnimated{
    
    objc_setAssociatedObject(self, @selector(bOpenLoadAnimated), [NSNumber numberWithBool:bOpenLoadAnimated], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)bOpenLoadAnimated
{
    return objc_getAssociatedObject(self, @selector(bOpenLoadAnimated));
}


- (void)showHub{
    [self showHubWithText:nil];
}

- (void)ajustLoadingHubView
{
    if (self.hubView)
    {
        [self.hubView ajustSubviews];
    }
}

- (void)showHubWithText:(NSString *)text
{
    [self showHubWithTextForTextReadingView:text useDelay:YES];
}

- (void)showHubWithText:(NSString *)text useDelay:(BOOL)bUse
{
    [self showHubWithTextForTextReadingView:text useDelay:bUse];
}

- (void)showHubWithTextForTextReadingView:(NSString *)text
{
    [self showHubWithTextForTextReadingView:text useDelay:YES];
}

- (void)showHubWithTextForTextReadingView:(NSString *)text useDelay:(BOOL)bUse
{
    if (self.hubView == nil)
    {
        UIView *mainView = [UIApplication sharedApplication].keyWindow;//self.mainNaviCtrl.topViewController.view;
        if (mainView)
        {
            CGFloat hub_w = VIEW_HUB_Width;//112;
            CGFloat hub_h = 60;//86;
            CGRect frame;
            frame = CGRectMake((mainView.bounds.size.width-hub_w)/2,
                               (mainView.bounds.size.height-hub_h)/2,
                               hub_w,
                               hub_h);
            
            [[DZMobileCtrl sharedCtrl] updateRootHub:[[NiHubView alloc] initWithFrame:frame]];
            [self.hubView setText:text bHidden:NO];
            
            [mainView addSubview:(UIView *)self.hubView];
            if (![[UIApplication sharedApplication] isIgnoringInteractionEvents])
                [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
            self.hubView.hidden = YES;
        }
        
    }
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHubDelay) object:nil];
    if (!bUse)
    {
        self.hubView.hidden = NO;
    }
    else
    {
        if (!self.bOpenLoadAnimated)//新建的
        {
            self.hubView.hidden = YES;
            [self performSelector:@selector(showHubDelay) withObject:nil afterDelay:0.5];//0.5s 后显示,7.8.3不做延时了，不然引起cancel
        }
    }
    
    self.bOpenLoadAnimated = YES;
}

- (void)showHub:(BOOL)bShow
{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHubDelay) object:nil];
    if (self.hubView)
    {
        self.hubView.hidden = !bShow;
    }
}

- (void)hideHubView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHubDelay) object:nil];
    if (self.hubView)
    {
        [self.hubView removeFromSuperview];
        [[DZMobileCtrl sharedCtrl] updateRootHub:nil];
    }
    while ([[UIApplication sharedApplication] isIgnoringInteractionEvents])
    {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }
    self.bOpenLoadAnimated = NO;
}

- (void)bringHubViewToFront
{
    UIView *mainView = [UIApplication sharedApplication].keyWindow;//self.mainNaviCtrl.topViewController.view;
    if (mainView && self.hubView)
    {
        [mainView bringSubviewToFront:self.hubView];
    }
}


#pragma mark - private methods
- (void)showHubDelay
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHubDelay) object:nil];
    if (self.hubView)
    {
        self.hubView.hidden = NO;
    }
}


/// 不影响手势操作的loading
- (void)showLoadingView:(UIView *)superView{
    [[DZLoadingAniView sharedView] startLoadingWithSuperView:superView];
}

- (void)hideLoadingView{
    [[DZLoadingAniView sharedView] stopLoadingView];
}




@end

