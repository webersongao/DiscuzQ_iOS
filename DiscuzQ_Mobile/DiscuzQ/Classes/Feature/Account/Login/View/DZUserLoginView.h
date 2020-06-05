//
//  DZUserLoginView.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/10.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZTextField.h"

@interface DZUserLoginView : UIScrollView

@property (nonatomic, strong) DZTextField *nameView;
@property (nonatomic, strong) DZTextField *pwordView;

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *forgetBtn;

@property (nonatomic, strong) UIButton *qqBtn;
@property (nonatomic, strong) UIView *thirdView;
@property (nonatomic, strong) UIButton *wechatBtn;
@property (nonatomic, strong) UILabel *thridAuthTipLabl;


-(instancetype)initWithFrame:(CGRect)frame isQQ:(BOOL)isQQ isWx:(BOOL)isWx;

@end
