//
//  DZFavoriteThreadController.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZDiscoverListView.h"

@interface DZFavoriteThreadController : DZBaseViewController

@property (nonatomic, strong) DZDiscoverListView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;


@end
