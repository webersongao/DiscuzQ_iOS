//
//  ZHAlertView.m
//  DouMaoKeji
//
//  Created by DouMao on 17/10/29.
//  Copyright © 2015年 DouMao. All rights reserved.
//

#import "ZHAlertView.h"
//#import "ZXPAutoLayout.h"
#import <ZXPAutoLayout.h>

#define KScrWidth   [[UIScreen mainScreen] bounds].size.width

#define kButtonHeight           50.0f
#define kAlertWidth             (KScrWidth * 0.8) // 270.0f
#define kButtonFont             16.f

static CGFloat kAlertHeight = 136.f;

@interface ZHAlertView ()
{
    BOOL _leftLeave;
}
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *backImageView;
@property (nonatomic, strong) UILabel *alertTitleLabel;
@property (nonatomic, strong) UILabel *alertContentLabel;

@property (nonatomic, strong) UIButton *contentTipButton;

@end

@implementation ZHAlertView

- (void)dealloc {
    
}

+ (CGFloat)alertWidth
{
    return kAlertWidth;
}

+ (CGFloat)alertHeight
{
    return kAlertHeight;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
{
    if (self = [super init]) {
        self.tag = KAlertTag;
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = [UIColor color16WithHexString:@"#ffffff" alpha:1.0];
        
        NSInteger zongHang = (content.length / 15);
        kAlertHeight = 135.f + (zongHang * 14.0);
        
        if (!leftTitle) {
    
            [self creatOneButtonWithTitle:title contentText:content rightButtonTitle:rigthTitle];
            
        }else {
            
            [self creatLeftAndRightButtonWithTitle:title contentText:content leftButtonTitle:leftTitle rightButtonTitle:rigthTitle];
        }

    }
        return self;
}

- (id)initWithTitle:(NSString *)title contentText:(NSString *)content contentTipText:(NSString *)tipText leftButtonTitle:(NSString *)leftTitle rightButtonTitle:(NSString *)rigthTitle {
    if (self = [super init]) {
        self.tag = KAlertTag;
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = [UIColor color16WithHexString:@"#ffffff" alpha:1.0];
        
        NSInteger zongHang = (content.length / 18);
        kAlertHeight = 180.f + (zongHang * 18.0);

        CGRect leftBtnFrame = CGRectZero;
        CGRect rightBtnFrame = CGRectZero;
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = leftBtnFrame;
        self.rightBtn.frame = rightBtnFrame;
        
        [self.rightBtn setBackgroundColor:[UIColor clearColor]];
        [self.leftBtn setBackgroundColor:[UIColor clearColor]];
        
        [self.rightBtn setTitle:rigthTitle forState:UIControlStateNormal];
        [self.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
        self.leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.leftBtn.titleLabel.font = self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:kButtonFont];
        [self.leftBtn setTitleColor:[UIColor color16WithHexString:@"#31323E" alpha:1.0] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor color16WithHexString:@"#33C3A5" alpha:1.0] forState:UIControlStateNormal];
        
        [self.leftBtn setBackgroundImage:[UIImage imageWithColor:KColor(@"#F5F6F8", 1.0) size:CGSizeMake(kAlertWidth/2, 49)] forState:UIControlStateHighlighted];
        [self.rightBtn setBackgroundImage:[UIImage imageWithColor:KColor(@"#F5F6F8", 1.0) size:CGSizeMake(kAlertWidth/2, 49)] forState:UIControlStateHighlighted];
        
        [self.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        
        //title
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = title;
        titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor color16WithHexString:@"#31323E" alpha:1.0];
        self.alertTitleLabel = titleLabel;
        [self addSubview:self.alertTitleLabel];
        [titleLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.leftSpace(20);
            layout.rightSpace(20);
            layout.topSpace(20);
        }];
        
        //content
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.text = content;
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:14.0];
        contentLabel.textColor = [UIColor color16WithHexString:@"#9A9AA7" alpha:1.0];
        self.alertContentLabel = contentLabel;
        [self addSubview:self.alertContentLabel];
        [contentLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.leftSpace(20);
            layout.topSpaceByView(titleLabel,15);
            layout.rightSpace(20);
        }];
        
        //contentTipButton
        self.contentTipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_contentTipButton setTitle:tipText forState:UIControlStateNormal];
        [_contentTipButton setTitleColor:[UIColor color16WithHexString:@"#9A9AA7" alpha:1.0] forState:UIControlStateNormal];
        [_contentTipButton setTitleColor:[UIColor color16WithHexString:@"#31323E" alpha:1.0] forState:UIControlStateSelected];
        [_contentTipButton setImage:[UIImage imageNamed:@"bookShelf_style_weixuan"] forState:UIControlStateNormal];
        [_contentTipButton setImage:[UIImage imageNamed:@"bookShelf_style_xuan"] forState:UIControlStateSelected];
        _contentTipButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        _contentTipButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        _contentTipButton.selected = NO;
        [_contentTipButton addTarget:self action:@selector(contentTipButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_contentTipButton];
        [_contentTipButton zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
//            layout.leftSpace(20);
            layout.xCenterByView(self, 0);
            layout.topSpaceByView(contentLabel,15);
        }];
        
        //灰色线条 横向
        UIView *hlineView = [[UIView alloc] init];
        [self addSubview:hlineView];
        [hlineView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.topSpaceByView(_contentTipButton,20);
            layout.heightValue(0.5);
            layout.leftSpace(0);
            layout.rightSpace(0);
        }];
        hlineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
        
        [self.leftBtn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.leftSpace(0);
            layout.topSpaceByView(hlineView,1);
            layout.heightValue(49);
            layout.widthValue(kAlertWidth/2);
        }];
        
        [self.rightBtn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.rightSpace(0);
            layout.topSpaceByView(hlineView,1);
            layout.heightValue(49);
            layout.widthValue(kAlertWidth/2);
        }];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
        [self addSubview:lineView];
        [lineView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
            layout.xCenterByView(self,0);
            layout.heightValue(45);
            layout.widthValue(0.5);
            layout.topSpaceByView(hlineView,0);
        }];
    }
    return self;
}


//// *********************** 工具方法  ***********************  ////

- (void)creatOneButtonWithTitle:(NSString *)title
                    contentText:(NSString *)content
               rightButtonTitle:(NSString *)rigthTitle
{
    CGRect rightBtnFrame = CGRectZero;
    
    rightBtnFrame = CGRectMake(20, kAlertHeight - kButtonHeight, (kAlertWidth - 40), kButtonHeight);
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = rightBtnFrame;
    [self.rightBtn setBackgroundColor:[UIColor clearColor]];
    [self.rightBtn setTitle:rigthTitle forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:kButtonFont];
    self.rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.rightBtn setTitleColor:[UIColor color16WithHexString:@"#31323E" alpha:1.0] forState:UIControlStateNormal];
     [self.rightBtn setBackgroundImage:[UIImage imageWithColor:KColor(@"#F5F6F8", 1.0) size:CGSizeMake(kAlertWidth, 49)] forState:UIControlStateHighlighted];
    [self.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:kButtonFont];
    titleLabel.textColor = [UIColor color16WithHexString:@"#31323E" alpha:1.0];
    self.alertTitleLabel = titleLabel;
    [self addSubview:self.alertTitleLabel];
    [titleLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.leftSpace(20);
        layout.topSpace(20);
        layout.xCenterByView(self,0);
    }];
    
    //content
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:14.0];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.textColor = [UIColor color16WithHexString:@"#9A9AA7" alpha:1.0];
    self.alertContentLabel = contentLabel;
    [self addSubview:self.alertContentLabel];
    [contentLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.leftSpace(20);
        layout.topSpaceByView(titleLabel,13);
        layout.rightSpace(20);
    }];

    //灰色线条 横向
    UIView *hlineView = [[UIView alloc] init];
    [self addSubview:hlineView];
    [hlineView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.bottomSpace(50);
        layout.heightValue(0.5);
        layout.leftSpace(0);
        layout.rightSpace(0);
    }];
    hlineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
    
    [self.rightBtn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.topSpaceByView(hlineView,1);
        layout.heightValue(49);
        layout.leftSpace(0);
        layout.rightSpace(0);
        layout.xCenterByView(self,0);
    }];
}

- (void)creatLeftAndRightButtonWithTitle:(NSString *)title
                             contentText:(NSString *)content
                         leftButtonTitle:(NSString *)leftTitle
                        rightButtonTitle:(NSString *)rigthTitle
{
    CGRect leftBtnFrame = CGRectZero;
    CGRect rightBtnFrame = CGRectZero;

    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = leftBtnFrame;
    self.rightBtn.frame = rightBtnFrame;
    
    [self.rightBtn setBackgroundColor:[UIColor clearColor]];
    [self.leftBtn setBackgroundColor:[UIColor clearColor]];
    
    [self.rightBtn setTitle:rigthTitle forState:UIControlStateNormal];
    [self.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    
    self.leftBtn.titleLabel.font = self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:kButtonFont];
    self.leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.leftBtn setTitleColor:[UIColor color16WithHexString:@"#31323E" alpha:1.0] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor color16WithHexString:@"#33C3A5" alpha:1.0] forState:UIControlStateNormal];
    
     [self.leftBtn setBackgroundImage:[UIImage imageWithColor:KColor(@"#F5F6F8", 1.0) size:CGSizeMake(kAlertWidth/2, 49)] forState:UIControlStateHighlighted];
     [self.rightBtn setBackgroundImage:[UIImage imageWithColor:KColor(@"#F5F6F8", 1.0) size:CGSizeMake(kAlertWidth/2, 49)] forState:UIControlStateHighlighted];
    
    [self.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:kButtonFont];
    titleLabel.textColor = [UIColor color16WithHexString:@"#31323E" alpha:1.0];
    self.alertTitleLabel = titleLabel;
    [self addSubview:self.alertTitleLabel];
    [titleLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.leftSpace(20);
        layout.topSpace(20);
        layout.xCenterByView(self,0);
    }];
    
    //content
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:14.0];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.textColor = [UIColor color16WithHexString:@"#9A9AA7" alpha:1.0];
    self.alertContentLabel = contentLabel;
    [self addSubview:self.alertContentLabel];
    [contentLabel zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.leftSpace(20);
        layout.topSpaceByView(titleLabel,13);
        layout.rightSpace(20);
    }];
    
    //灰色线条 横向
    UIView *hlineView = [[UIView alloc] init];
    [self addSubview:hlineView];
    [hlineView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.bottomSpace(50);
        layout.heightValue(0.5);
        layout.leftSpace(0);
        layout.rightSpace(0);
    }];
    hlineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
    
    [self.leftBtn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.leftSpace(0);
        layout.topSpaceByView(hlineView,1);
        layout.heightValue(49);
        layout.widthValue(kAlertWidth /2);
    }];
    
    [self.rightBtn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.rightSpace(0);
        layout.topSpaceByView(hlineView,1);
        layout.heightValue(49);
        layout.widthValue(kAlertWidth /2);
    }];
    
    if (self.haveCancel) {
        UIButton *xButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [xButton setImage:[UIImage imageNamed:@"ZHVote_X"] forState:UIControlStateNormal];
        xButton.frame = CGRectMake(kAlertWidth - 34, 5, 20, 20);
        [self addSubview:xButton];
        [xButton addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
    [self addSubview:lineView];
    [lineView zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.xCenterByView(self,0);
        layout.heightValue(49);
        layout.widthValue(0.5);
        layout.topSpaceByView(hlineView,0);
    }];
    
}


- (void)leftBtnClicked:(id)sender
{
    _leftLeave = YES;
    //代码位置调整到 上面 ，已支持，点击按钮弹出新的alertView
    [self dismissAlert];
    if (self.leftBlock) {
        self.leftBlock();
    }
}

- (void)rightBtnClicked:(id)sender
{
    _leftLeave = NO;
    
    [self dismissAlert];
    if (self.rightBlock) {
        self.rightBlock();
    }
}

- (void)contentTipButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (BOOL)contentTipStatus {
    return _contentTipButton.selected;
}

- (void)setTipDefaultSelect:(BOOL)select
{
    if (_contentTipButton) {
        _contentTipButton.selected = select;
    }
}

- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    UIView *alertView = [topVC.view viewWithTag:KAlertTag];
    if (alertView.superview == nil ) {
        self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, kAlertWidth, kAlertHeight);
        [topVC.view addSubview:self];
    }
}

- (void)mustShow
{
    UIViewController *topVC = [self appRootViewController];
    UIView *alertView = [topVC.view viewWithTag:KAlertTag];
    if (alertView.superview) {
        [alertView removeFromSuperview];
    }
    if (alertView.superview == nil ) {
        self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, kAlertWidth, kAlertHeight);
        [topVC.view addSubview:self];
    }
}

- (void)showInView:(UIView *)view
{
    CGFloat top = view.height/2 - kAlertHeight/2;
    self.frame = CGRectMake((CGRectGetWidth(view.bounds) - kAlertWidth) * 0.5, top, kAlertWidth, kAlertHeight);
    self.tag = KAlertTag;
   
    UIView *alertView = [view viewWithTag:KAlertTag];
    if (alertView.superview == nil ) {
        self.frame = CGRectMake((CGRectGetWidth(view.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, kAlertWidth, kAlertHeight);
        [view addSubview:self];
    }
}

- (void)dismissAlert
{
    if (self.dismissBlock) {
        self.dismissBlock();
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(0.95, 0.95);
        self.alpha = 0;
        self.backImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    
    [super removeFromSuperview];
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIView *superView = newSuperview;
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:superView.bounds];
        self.backImageView.backgroundColor = [KBlack_Color colorWithAlphaComponent:0.6];
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backImageView.alpha = 0;
    }
    [superView addSubview:self.backImageView];
    [UIView animateWithDuration:0.2 animations:^{
        self.backImageView.alpha = 1;
    }];
    
    
    CGRect afterFrame = CGRectMake((CGRectGetWidth(superView.bounds) - kAlertWidth) * 0.5, (CGRectGetHeight(superView.bounds) - kAlertHeight) * 0.5, kAlertWidth, kAlertHeight);
    
    self.transform = CGAffineTransformIdentity;
    self.frame = afterFrame;
    
    self.transform = CGAffineTransformMakeScale(0.95, 0.95);
    [super willMoveToSuperview:newSuperview];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end

@implementation UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
