//
//  DZDiscoverCateController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZPlayBaseViewController.h"

@class DZBaseForumModel;

@interface DZDiscoverCateController : DZPlayBaseViewController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZQDataCate *)model;

-(void)updateDiscoverCateControllerView;

@end


