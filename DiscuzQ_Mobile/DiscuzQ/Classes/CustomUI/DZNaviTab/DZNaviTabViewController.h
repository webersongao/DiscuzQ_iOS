//
//  DZNaviTabViewController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/4/27.
//

#import "DZBaseViewController.h"
#import "DZNaviTabView.h"

@interface DZNaviTabViewController : DZBaseViewController


- (instancetype)initWithTabArr:(NSArray<DZTabItem *> *)tabArray;

-(void)updateTabFont:(UIFont *)font titleColor:(UIColor *)titleColor highColor:(UIColor *)highColor;



@end
