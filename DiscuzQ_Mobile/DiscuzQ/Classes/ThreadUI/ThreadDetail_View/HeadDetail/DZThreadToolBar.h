//
//  DZThreadToolBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadToolBar : DZThreadBottomBar


-(void)updateDetailToolBar:(DZQDataThread *)Model toolLayout:(DZDToolBarStyle *)toolLayout;



@end

NS_ASSUME_NONNULL_END
