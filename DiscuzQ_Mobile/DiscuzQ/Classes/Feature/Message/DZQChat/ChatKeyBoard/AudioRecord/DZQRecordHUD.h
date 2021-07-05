//
//  DZQRecordHUD.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZQRecordHUD : UIView

+ (void)show;

+ (void)dismissWithSuccess:(NSString *)str;

+ (void)dismissWithError:(NSString *)str;

+ (void)changeSubTitle:(NSString *)str;

@end
