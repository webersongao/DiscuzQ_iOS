//
//  UITextField+Common.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITextField (Common)


- (BOOL)isEmoji;

- (void)placeHolder:(NSString *)placeHolder color:(UIColor * __nullable)color font:(UIFont * __nullable)font;


@end


