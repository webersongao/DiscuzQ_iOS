//
//  DZVerticalButton.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZVerticalButton : UIView

@property (nonnull, strong) UIImageView *iconV;
@property (nonnull, strong) UILabel *textLabel;

- (void)addTarget:(nonnull id)target action:(nonnull SEL)action;

@end
