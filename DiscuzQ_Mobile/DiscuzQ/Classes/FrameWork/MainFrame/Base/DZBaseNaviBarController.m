//
//  DZBaseNaviBarController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZBaseNaviBarController.h"
#import "DZNavItemButton.h"

@interface DZBaseNaviBarController ()

@end

@implementation DZBaseNaviBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dz_SetNavigationBar];
    self.view.backgroundColor = KDebug_Color;
}

//重写系统设置title的setter
- (void)setTitle:(NSString *)title {
    //正常创建控制器是先执行[alloc init] 后执行这句 在执行时在给予赋值
        [super setTitle:title];
    self.dz_NavigationBar.titleString = title;
}

#pragma mark -设置导航栏
- (void)dz_SetNavigationBar {
    
    [self.view addSubview:self.dz_NavigationBar];
    
}

-(void)setDz_HideNaviBar:(BOOL)dz_HideNaviBar {
    _dz_HideNaviBar = dz_HideNaviBar;
    self.dz_NavigationBar.hidden = dz_HideNaviBar;
}

- (void)p_ClickBackBtn {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setdz_NavigationAlpha:(CGFloat)dz_NavigationAlpha {
    
    _dz_NavigationAlpha = dz_NavigationAlpha;
    self.dz_NavigationBar.alpha = dz_NavigationAlpha;
}

- (void)setdz_BarTintColor:(UIColor *)dz_BarTintColor {
    
    _dz_BarTintColor = dz_BarTintColor;
    self.dz_NavigationBar.barTintColor = dz_BarTintColor;
}

- (void)setdz_BarTitleTextColor:(UIColor *)dz_BarTitleTextColor {
    if (dz_BarTitleTextColor) {
        _dz_BarTitleTextColor = dz_BarTitleTextColor;
        self.dz_NavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : dz_BarTitleTextColor};
    }
}

- (void)setdz_BarTitleFont:(UIFont *)dz_BarTitleFont {
    if (dz_BarTitleFont) {
        _dz_BarTitleFont = dz_BarTitleFont;
        self.dz_NavigationBar.titleTextAttributes = @{NSFontAttributeName : dz_BarTitleFont};
    }
}

- (void)dz_SetNavigationBackItemWithTarget:(id)target action:(SEL)action {
    
    DZBarButtonItem *textItem = [[DZBarButtonItem alloc] initImageBarButton:@"navi_reader_Back" touchH:@"navi_reader_Back" isBack:YES target:target action:action];
    [self dz_SetNaviOneButtonItem:textItem Layout:YES];
}

- (UIButton *)dz_SetNaviOneButtonItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft{
    if (!item) {
        return nil;
    }
    return [self.dz_NavigationBar updateNaviOneItem:item Layout:isLeft];
}

- (void)dz_SetNaviButtonItems:(NSArray<DZBarButtonItem *> *)items Layout:(BOOL)isLeft{
    [self.dz_NavigationBar updateNaviItems:items Layout:isLeft];
}

/**
 *设置导航条Logo视图
 @param imagePath 本地或者网络图片
 */
- (void)dz_SetNavigationlogoView:(NSString *)imagePath{
    
    NSString *logoPath = [imagePath hasPrefix:@"http"] ? DZ_Logo_image : imagePath;
    [self.dz_NavigationBar updateNaviLogo:KImageNamed(logoPath) path:imagePath];
}

- (void)dz_SetNavigationTitleView:(UIView *)titleView
{
    self.dz_NavigationBar.titleView = titleView;
}

- (void)dz_AddSubView:(UIView *)view belowNavigationBar:(BOOL)isBelow {
    
    if (isBelow) {
        [self.view insertSubview:view belowSubview:self.dz_NavigationBar];
    }else {
        [self.view insertSubview:view aboveSubview:self.dz_NavigationBar];
    }
}


/// 将导航条置于顶层
-(void)dz_bringNavigationBarToFront{
    self.dz_NavigationBar.hidden = NO;
    [self.view bringSubviewToFront:self.dz_NavigationBar];
}

-(void)leftBarBtnClick:(UIButton *)button {
    
}

- (BOOL)isPresent {
    
    BOOL isPresent = false;
    
    NSArray *viewcontrollers = self.navigationController.viewControllers;
    
    if (viewcontrollers.count > 1) {
        isPresent = !(self.navigationController.topViewController == self); //push方式
    }else{
        isPresent = YES;  // modal方式
    }
    
    return isPresent;
}

-(void)dz_PopCurrentViewController{
    if (self.isPresent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (DZNavigationBar *)dz_NavigationBar{
    if (!_dz_NavigationBar) {
        _dz_NavigationBar = [[DZNavigationBar alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KNavi_ContainStatusBar_Height)];
    }
    return _dz_NavigationBar;
}



@end





