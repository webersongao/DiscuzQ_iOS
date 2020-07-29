//
//  DZHomeNewListCtroller.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/10.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseTableController.h"
#import "HomeHeader.h"

@interface DZHomeNewListCtroller : DZBaseTableController

@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) void(^didScrollAction)(UIScrollView *scrollView);  //!< 属性注释




@end
