//
//  TaskTipHubView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TaskTipHubView.h"
#import "DTTextView.h"
#import "TipHubViewManager.h"

static const CGFloat kFontSize = 14.0;
static const CGFloat kLineHeightMultiplier = 1.0f;
static const CGFloat kLabelWidth = 200.0f;


@interface TaskTipHubView ()

{
    UIImageView *_animationView;
    DTTextView  *_tipLabel;
    UIView      *_labelbkgView;
    CGSize      _imageSize;
}

@end

@implementation TaskTipHubView

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:KScreenBounds])
    {
        [self createView];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationAction:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    // 添加了StatusBarOrientation改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationAction:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)createView
{
    _labelbkgView = [[UIView alloc] init];
    [self addSubview:_labelbkgView];
    
    _tipLabel = [[DTTextView alloc] initWithFrame:CGRectMake(0, 0, 200, 28)];
    _tipLabel.lineHeightMultiplier = 1.5;
    _tipLabel.defaultTextColor = @"#FFFFFF";
    [self addSubview:_tipLabel];
    
    _animationView = [[UIImageView alloc] init];
    [self addSubview:_animationView];
    
    _labelbkgView.clipsToBounds = YES;
    _labelbkgView.layer.cornerRadius = 5;
    _tipLabel.fontSize = kFontSize;
    _tipLabel.lineHeightMultiplier = kLineHeightMultiplier;

}

- (void)loadImages:(NSString*)path
{
    NSArray *fileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray * images = [NSMutableArray array];
    for (NSString* file in fileArray)
    {
        if ([[[file pathExtension] lowercaseString] isEqualToString:@"jpg"]
            || [[[file pathExtension] lowercaseString] isEqualToString:@"png"])
        {
           NSString * Localfile = [NSString stringWithFormat:@"%@%@",path,file];
            UIImage* image = [UIImage imageWithContentsOfFile:Localfile];
            _imageSize = image.size;
            [images addObject:image];
        }
    }
    
    _animationView.animationImages = images;
}

- (void)orientationAction:(NSNotification *)ns
{
    [self adjustViews];
}

- (void)adjustSubviews
{
    CGFloat clientWidth = KScreenWidth;
    CGFloat clientHeight = KScreenHeight;

        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if ((statusBarOrientation == UIInterfaceOrientationLandscapeLeft) ||
            (statusBarOrientation == UIInterfaceOrientationLandscapeRight) )
        {
            clientHeight = KScreenWidth;
            clientWidth = KScreenHeight;

        }
    
}

- (void)adjustViews
{
    CGFloat clientWidth = KScreenWidth;
    CGFloat clientHeight = KScreenHeight;
    CGRect  clientFrame = KScreenBounds;
    CGAffineTransform trans = CGAffineTransformMakeRotation(0);
    
    {
        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (statusBarOrientation)
        {
            case UIInterfaceOrientationPortrait:
            {
                trans = CGAffineTransformMakeRotation(0);
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:
            {
                trans = CGAffineTransformMakeRotation(M_PI_2*3);
                clientHeight = KScreenWidth;
                clientWidth = KScreenHeight;
            }
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                trans = CGAffineTransformMakeRotation(M_PI);
            }
                break;
            case UIInterfaceOrientationLandscapeRight:
            {
                trans = CGAffineTransformMakeRotation(M_PI_2);
                clientHeight = KScreenWidth;
                clientWidth = KScreenHeight;
            }
                break;
        }
        self.frame = CGRectMake((KScreenWidth - clientWidth)/2,
                                (KScreenHeight - clientHeight)/2, clientWidth, clientHeight);
    }
    
    self.transform = trans;
}

- (void)initView
{
    [_tipLabel setHTMLString:_text];
    NSInteger width = 750;
    if (KScreenWidth > 375)
    {
        width = 1125;
    }
    [self adjustViews];
    
    [_animationView startAnimating];
}

- (void)showTipHubView
{
    [self initView];
}

- (void)closeTipHubView
{
    if ([TipHubViewManager staticTipHubView] == (TipHubView *)self)
    {
        [TipHubViewManager setStaticTipHubView:nil];
    }
    
    if (self)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(closeTipHubView) object:nil];
        [_animationView stopAnimating];
        [self removeFromSuperview];
        
        if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count])
        {
            [[DZMobileCtrl sharedCtrl].tipHubViewArr removeObjectAtIndex:0];
        }
        
        if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count] == 0)
        {
            [[DZMobileCtrl sharedCtrl] showHub:YES];
        }
        else
        {
            [TipHubViewManager showNextHubView];
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    if (CGRectContainsPoint(self.frame, point))
    {
        [self closeTipHubView];
    }
    
}

@end
