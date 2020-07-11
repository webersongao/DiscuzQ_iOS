//
//  DZThreadCashPayView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCashPayView : UIView

-(void)updateThreadPayView:(DZQDataThread *)Model payLayout:(DZDPayStyle *)layout;

@end

NS_ASSUME_NONNULL_END
