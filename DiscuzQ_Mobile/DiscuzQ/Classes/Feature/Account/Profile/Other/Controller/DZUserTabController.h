//
//  DZUserTabController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

#define KOtherHeaderH 130.f

@interface DZUserTabController : DZBaseViewController

- (instancetype)initTabFrame:(CGRect)frame userId:(NSString *)userId;

-(void)updateFilstUserTabControllerView;



@end
