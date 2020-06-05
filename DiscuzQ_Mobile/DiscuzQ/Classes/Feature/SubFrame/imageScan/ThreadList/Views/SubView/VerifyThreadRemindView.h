//
//  VerifyThreadRemindView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/16.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerifyThreadRemindView : UIView
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, copy) void(^clickRemindBlock)(void);
@end
