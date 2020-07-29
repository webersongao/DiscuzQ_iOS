//
//  DZNaviTabView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTabItem.h"

#define k_NaviTab_BtnW 80
#define k_NaviTab_BtnTag 1000


@interface DZNaviTabView : UIView


-(NSInteger)updateNaviTabViewState:(NSInteger)index;

- (instancetype)initWithTabArr:(NSArray<DZTabItem *> *)tabArray Target:(id)target action:(SEL)btnAction;

@property (nonatomic, strong) UIFont *titleFont;  //!< 属性注释
@property (nonatomic, strong) UIColor *titleColor;  //!< 正常模式
@property (nonatomic, strong) UIColor *titleHighColor;  //!< 高亮颜色


@end


