//
//  DZThreadStick.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/7.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZThreadListStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadStick : UIView

- (void)updateStickBar:(DZThreadListStyle *)listStyle;

@end

NS_ASSUME_NONNULL_END
