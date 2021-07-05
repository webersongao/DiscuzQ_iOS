//
//  LoginBaseController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2017/7/12.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZShareCenter.h"

typedef void(^RefreshBlock)(void);

@interface LoginBaseController : DZBaseViewController <UIScrollViewDelegate>

@property (nonatomic, assign) BOOL isTabbarSelected;     // tabbar页面的时候跳登录页面考虑这个属性

- (void)updateUserWhenSuccess:(DZQTokenV1 *)tokenModel;

@end
