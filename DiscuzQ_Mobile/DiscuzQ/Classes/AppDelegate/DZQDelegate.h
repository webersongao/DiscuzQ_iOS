//
//  DZQDelegate.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/7/12.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZQDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (DZQDelegate *)appDelegate;

@property (nonatomic, assign) BOOL isOpenUrl; // 当首次打开APP和三方登录等情况不用判断cookie的有效性

@property (nonatomic, assign) BOOL allowOrentitaionRotation;

@end

