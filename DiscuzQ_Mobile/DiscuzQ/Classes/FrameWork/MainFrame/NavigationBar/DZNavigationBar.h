//
//  DZNavigationBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNavItemButton.h"

@interface DZNavigationBar : UIView

@property (nonatomic,strong) UIView *titleView;

@property (nonatomic,copy) NSString *titleString;

@property (nonatomic,strong) UIColor *barTintColor;

@property (nonatomic, strong,readonly) UIView *bottomLine;  //!< 属性注释

@property (nonatomic, strong, readonly) DZNavItemButton *leftButton;  //!< 属性注释
@property (nonatomic, strong, readonly) DZNavItemButton *leftButton2;  //!< 属性注释
@property (nonatomic, strong, readonly) DZNavItemButton *rightButton;  //!< 属性注释
@property (nonatomic, strong, readonly) DZNavItemButton *rightButton2;  //!< 属性注释

@property (nonatomic, strong) NSDictionary *titleTextAttributes;

-(void)updateNaviLogo:(UIImage *)naviLogo path:(NSString *)urlPath;

-(void)updateNaviItems:(NSArray<DZBarButtonItem *> *)items Layout:(BOOL)isLeft;

// 左侧 或 右侧 第一个
-(UIButton *)updateNaviOneItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft;

// 左侧 或 右侧 第二个
-(UIButton *)updateNaviThirdItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft;


@end


