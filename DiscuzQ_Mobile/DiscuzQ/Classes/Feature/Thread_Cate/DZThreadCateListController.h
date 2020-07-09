//
//  DZThreadCateListController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZBaseViewController.h"

@interface DZThreadCateListController : DZBaseViewController

@property (nonatomic ,strong) DZQDataCate *dataCate;

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) UIView *contentView;
// 设置tableview滚动属性
- (void)setScrollEnable:(BOOL)scrollable;

@end
