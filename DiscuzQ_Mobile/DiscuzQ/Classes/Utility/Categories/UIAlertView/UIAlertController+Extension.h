//
//  UIAlertController+Extension.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/3/28.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)

+ (void)alertTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneText:(NSString *)doneText cancelText:(NSString *)cancelText doneHandle:(void(^)(void))doneHandle cancelHandle:(void(^)(void))cancelHandle;

+ (void)alertTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneTextArr:(NSArray *)doneTextArr cancelText:(NSString *)cancelText doneHandle:(void(^)(NSInteger index))doneHandle cancelHandle:(void(^)(void))cancelHandle;

+ (void)alertSheetTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneTextArr:(NSArray *)doneTextArr cancelText:(NSString *)cancelText doneHandle:(void(^)(NSInteger index))doneHandle cancelHandle:(void(^)(void))cancelHandle;

+ (void)alertTextFieldWithTitle:(NSString *)title message:(NSString *)message firstHolder:(NSString *)firstHolder secendHolder:(NSString *)secendHolder oriController:(UIViewController *)OriCtrl doneText:(NSString *)doneText cancelText:(NSString *)cancelText doneHandle:(void(^)(UIAlertController *AlertCtrl,UITextField *firstField,UITextField *secendField))doneHandle cancelHandle:(void(^)(void))cancelHandle;

@end
