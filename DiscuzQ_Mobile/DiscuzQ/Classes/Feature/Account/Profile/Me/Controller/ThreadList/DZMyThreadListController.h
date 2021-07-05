//
//  MyTopicViewController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/5. 
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHomeListView.h"

@interface DZMyThreadListController : DZBaseViewController

@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;

-(void)first_LoadMyListThreadViewData;


@end
