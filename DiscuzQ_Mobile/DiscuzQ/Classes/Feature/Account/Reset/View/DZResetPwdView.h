//
//  DZResetPwdView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/17.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DZTextField;

@interface DZResetPwdView : UIScrollView <UITextFieldDelegate>

@property (nonatomic, strong) DZTextField *passwordView;
@property (nonatomic, strong) DZTextField *repassView;
@property (nonatomic, strong) DZTextField *newpasswordView;

@property (nonatomic, strong) UIButton *submitButton;

@end
