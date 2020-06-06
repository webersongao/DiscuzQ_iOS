//
//  DZBaseNaviBarController.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZBaseNaviBarController.h"
#import "DZNavItemButton.h"
#import "UIBarButtonItem+Utils.h"

@interface DZBaseNaviBarController ()

@end

@implementation DZBaseNaviBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dz_SetNavigationBar];
    self.view.backgroundColor = KRandom_Color;
}

//重写系统设置title的setter
- (void)setTitle:(NSString *)title {
    //正常创建控制器是先执行[alloc init] 后执行这句 在执行时在给予赋值
    [super setTitle:title];
    if (!_dz_HideTitle) {
        self.dz_NavigationItem.title = title;
    }
}

#pragma mark -设置导航栏
- (void)dz_SetNavigationBar {
    
    [self.view addSubview:self.dz_NavigationBar];
    
    //将导航条目 添加到导航条
    self.dz_NavigationBar.items = @[self.dz_NavigationItem];
    
    //导航条的渲染颜色
    self.dz_NavigationBar.barTintColor = [UIColor color16WithHexString:@"#FFFFFF" alpha:1];
    
    UIFont *font = KExtraBoldFont(17.0f);
    UIColor *color = [UIColor color16WithHexString:@"#2D3035" alpha:1];
    //设置 bar 的标题字体颜色
    self.dz_NavigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : color, NSFontAttributeName : font};
    
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
    
    [self dz_SetNavigationItemWithInfoString:@"navi_reader_Back" Type:DZNaviItemType_Image Layout:YES FixSpace:YES target:target action:action];
}

- (void)dz_SetNavigationRightTextItemWithInfoString:(NSString *)infoStr target:(id)target action:(SEL)action {
    [self dz_SetNavigationItemWithInfoString:infoStr Type:DZNaviItemType_Text Layout:NO FixSpace:YES target:target action:action];
}

- (void)dz_SetNavigationItemWithInfoString:(NSString *)infoStr Type:(DZNaviItemType)type Layout:(BOOL)isLeft FixSpace:(BOOL)isFix target:(id)target action:(SEL)action {
    UIBarButtonItem *item;
    NSMutableArray *currentItems = [NSMutableArray arrayWithArray:isLeft ? self.dz_NavigationItem.leftBarButtonItems : self.dz_NavigationItem.rightBarButtonItems];
    if (type == DZNaviItemType_Text) {
        item = [[UIBarButtonItem alloc] initWithItemTitle:infoStr Layout:isLeft target:target action:action];
    }
    
    if (type == DZNaviItemType_Image) {
        item = [[UIBarButtonItem alloc] initWithItemImageName:infoStr Layout:isLeft target:target action:action];
    }
    
    //    if (isFix && !currentItems.count) {
    //        //为了缩进
    //        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //        spaceItem.width = -5;
    //        [currentItems addObject:spaceItem];
    //    }
    
    if (!isLeft) {
        [currentItems insertObject:item atIndex:0];
    }else {
        [currentItems addObject:item];
    }
    
    [self dz_SetItems:[currentItems copy] Layout:isLeft];
}

- (void)dz_SetItem:(UIBarButtonItem *)item Layout:(BOOL)isLeft {
    
    if (isLeft) {
        self.dz_NavigationItem.leftBarButtonItem = item;
    }else {
        self.dz_NavigationItem.rightBarButtonItem = item;
    }
}

- (void)dz_SetItems:(NSArray *)items Layout:(BOOL)isLeft {
    
    if (isLeft) {
        self.dz_NavigationItem.leftBarButtonItems = items;
    }else {
        self.dz_NavigationItem.rightBarButtonItems = items;
    }
}

/**
 *设置导航条Logo视图
 
 @param imagePath 本地或者网络图片
 */
- (void)dz_SetNavigationlogoView:(NSString *)imagePath{
    
    self.dz_NavigationItem.title = nil;
    self.dz_NavigationItem.titleView = nil;
    if (![imagePath hasPrefix:@"http"]) {
        self.dz_NavigationBar.naviLogo.image = KImageNamed(imagePath);
    }else{
        [self.dz_NavigationBar.naviLogo dz_setImageWithURL:imagePath];
    }
}

- (void)dz_SetNavigationTitleView:(UIView *)titleView
{
    self.dz_NavigationItem.titleView = titleView;
}

- (void)dz_CancelScrollViewInsetWithTableView:(UITableView *)tableview {
    
    if (@available(iOS 11.0, *)) {
        tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
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

- (void)leftBarBtnClick {
    
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

- (UINavigationItem *)dz_NavigationItem{
    if (!_dz_NavigationItem) {
        _dz_NavigationItem = [[UINavigationItem alloc] init];
    }
    return _dz_NavigationItem;
}



@end





