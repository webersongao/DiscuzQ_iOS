//
//  UITableViewCell+Animation.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "UITableViewCell+Animation.h"

@implementation DZBaseTableViewCell (Animation)


-(void)cellWillDisplayWith3DScaleTransform{
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.5 animations:^{
        [UIView animateWithDuration:1.0 animations:^{
            self.layer.transform  = CATransform3DIdentity;
        }];
    }];
}


@end
