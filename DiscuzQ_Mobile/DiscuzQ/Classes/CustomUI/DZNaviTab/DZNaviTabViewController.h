//
//  DZNaviTabViewController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/4/27.
//

#import "DZBaseViewController.h"
#import "DZNaviTabView.h"

@interface DZNaviTabViewController : DZBaseViewController


- (instancetype)initWithTabArr:(NSArray<DZTabItem *> *)tabArray;

-(void)updateTabFont:(UIFont *)font titleColor:(UIColor *)titleColor highColor:(UIColor *)highColor;


// 加载错误页面
- (void)bringErrorViewToSelfView;


@end
