//
//  DZThreadBottomBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZThreadListModel;

@interface DZThreadBottomBar : UIView

@property (nonatomic, strong) UIButton *zanButton;  //!< 点赞数

- (void)updateThreadBottomBar:(DZThreadListModel *)Model;



@end


