//
//  DZThreadHead.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZThreadListModel.h"

@interface DZThreadHead : UIView

@property (nonatomic, strong) UIButton *IconButton;  //!< 头像

- (void)updateThreadHeadWithModel:(DZThreadListModel *)Model;

@end


