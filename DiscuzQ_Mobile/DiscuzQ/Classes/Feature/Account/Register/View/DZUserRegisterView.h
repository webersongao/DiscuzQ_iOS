//
//  DZUserRegisterView.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/11.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTermsLabel.h"

@class DZTextField;

@interface DZUserRegisterView : UIScrollView <UITextFieldDelegate>

@property (nonatomic, strong) DZTextField *usernameView;
@property (nonatomic, strong) DZTextField *passwordView;
@property (nonatomic, strong) DZTextField *repassView;
@property (nonatomic, strong) UILabel *thridAuthTipLabl;

@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) DZTermsLabel *usertermsView;

@end
