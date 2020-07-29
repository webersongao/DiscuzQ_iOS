//
//  DZThreadTitle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DZThreadTitle : UIView

/// @param isTop 是否 置顶帖
- (void)updateThreadTitle:(NSString *)title isTop:(BOOL)isTop;
    
    
@end


