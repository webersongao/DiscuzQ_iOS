//
//  DZPostCommentBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDListStyle.h"
#import "DZThreadBottomBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZPostCommentBar : DZThreadBottomBar

-(void)updateCommentBar:(DZQDataPost *)dataPost layout:(DZDToolBarStyle *)toolLayout;


@end

NS_ASSUME_NONNULL_END
