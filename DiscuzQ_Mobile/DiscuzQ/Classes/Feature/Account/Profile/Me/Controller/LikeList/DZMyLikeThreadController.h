//
//  DZMyLikeThreadController.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZDiscoverListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMyLikeThreadController : DZBaseViewController

@property (nonatomic, strong) DZDiscoverListView *listView;  //!< 属性注释

- (instancetype)initWithUserid:(NSString *)user_id;

-(void)first_LoadMyLikeThreadViewData;


@end

NS_ASSUME_NONNULL_END
