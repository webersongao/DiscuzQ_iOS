//
//  UIAlertController+Extension.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/3/28.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

+ (void)alertTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneText:(NSString *)doneText cancelText:(NSString *)cancelText doneHandle:(void(^)(void))doneHandle cancelHandle:(void(^)(void))cancelHandle {
    UIAlertController *alertCT = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertActionStyle actionStyle = UIAlertActionStyleDestructive;
    if (cancelText == nil) {
        actionStyle = UIAlertActionStyleDefault;
    } else {
    
    }
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:doneText style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
        doneHandle?doneHandle():nil;
    }];
    [alertCT addAction:doneAction];
    if (cancelText != nil) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            cancelHandle?cancelHandle():nil;
        }];
        [alertCT addAction:cancelAction];
    }
    [controller presentViewController:alertCT animated:YES completion:nil];
}

+ (void)alertTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneTextArr:(NSArray *)doneTextArr cancelText:(NSString *)cancelText doneHandle:(void(^)(NSInteger index))doneHandle cancelHandle:(void(^)(void))cancelHandle {
    
    UIAlertController *alertCT = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSInteger i = 0; i < doneTextArr.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:doneTextArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            doneHandle?doneHandle(i):nil;
        }];
        [alertCT addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandle?cancelHandle():nil;
    }];
    [alertCT addAction:cancelAction];
    [controller presentViewController:alertCT animated:YES completion:nil];
}

+ (void)alertSheetTitle:(NSString *)title message:(NSString *)message controller:(UIViewController *)controller doneTextArr:(NSArray *)doneTextArr cancelText:(NSString *)cancelText doneHandle:(void(^)(NSInteger index))doneHandle cancelHandle:(void(^)(void))cancelHandle {
    
    UIAlertController *sheetAlertVc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger i = 0; i < doneTextArr.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:doneTextArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            doneHandle?doneHandle(i):nil;
        }];
        [sheetAlertVc addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandle?cancelHandle():nil;
    }];
    [sheetAlertVc addAction:cancelAction];
    [controller presentViewController:sheetAlertVc animated:YES completion:nil];
}


+ (void)alertTextFieldWithTitle:(NSString *)title message:(NSString *)message firstHolder:(NSString *)firstHolder secendHolder:(NSString *)secendHolder oriController:(UIViewController *)OriCtrl doneText:(NSString *)doneText cancelText:(NSString *)cancelText doneHandle:(void(^)(UIAlertController *AlertCtrl,UITextField *firstField,UITextField *secendField))doneHandle cancelHandle:(void(^)(void))cancelHandle {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = firstHolder;
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = secendHolder;
    }];
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:doneText style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        if (doneHandle) {
            doneHandle(alertController,alertController.textFields.firstObject,alertController.textFields.lastObject);
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandle) {
            cancelHandle();
        }
    }];
    [alertController addAction:doneAction];
    [alertController addAction:cancelAction];
    [OriCtrl showDetailViewController:alertController sender:nil];
    
}

@end
