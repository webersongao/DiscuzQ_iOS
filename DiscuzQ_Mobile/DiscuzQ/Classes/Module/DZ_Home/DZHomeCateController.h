//
//  DZHomeCateController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZPlayBaseViewController.h"

@interface DZHomeCateController : DZPlayBaseViewController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZThreadCateM *)model;

-(void)updateHomeCateControllerView;

@end


