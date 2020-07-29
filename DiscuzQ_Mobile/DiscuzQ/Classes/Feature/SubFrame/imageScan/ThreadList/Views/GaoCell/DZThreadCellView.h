//
//  DZThreadCellView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZThreadHead.h"
#import "DZThreadBottomBar.h"
@class DZThreadListModel;

@interface DZThreadCellView : UIView

@property (nonatomic, strong) DZThreadHead *headerView;  //!< 属性注释
@property (nonatomic, strong) DZThreadBottomBar *bottomBarView;  //!< 属性注释

- (void)updateThreadCellView:(DZThreadListModel *)Model;


@end


