//
//  UIView+CurrentController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/11/23.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CurrentController)

//获取当前屏幕显示的viewcontroller
+(UIViewController*)getCurrentUIVC;

+(UINavigationController*)getCurrentNaVC;

+(UIViewController*)getCurrentWindowVC;

+(UIViewController *)getSubUIVCWithVC:(UIViewController*)vc;


@end


