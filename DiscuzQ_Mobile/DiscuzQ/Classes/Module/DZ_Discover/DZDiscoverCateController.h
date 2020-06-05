//
//  DZDiscoverCateController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

@class DZBaseForumModel;

@interface DZDiscoverCateController : DZBaseViewController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZQDataCate *)model;

-(void)updateDiscoverCateControllerView;

@end


