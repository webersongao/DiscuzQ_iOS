//
//  DZMyLikeThreadController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHomeListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyLikeThreadController : DZBaseViewController

@property (nonatomic, strong) DZHomeListView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;

-(void)first_LoadMyLikeThreadViewData;


@end

NS_ASSUME_NONNULL_END
