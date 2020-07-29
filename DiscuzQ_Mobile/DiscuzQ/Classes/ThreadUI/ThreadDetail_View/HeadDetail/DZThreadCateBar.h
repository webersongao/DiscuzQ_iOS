//
//  DZThreadCateBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadBottomBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateBar : DZThreadBottomBar

-(void)updateDetailCategoryBar:(DZQDataCate *)cateModel toolLayout:(DZDToolBarStyle *)toolLayout;


@end

NS_ASSUME_NONNULL_END
