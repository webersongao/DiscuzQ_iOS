//
//  DZFavoriteThreadController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/20.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHomeListView.h"

@interface DZFavoriteThreadController : DZBaseViewController

@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;


@end
