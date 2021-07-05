//
//  UIAlertController+WKWebAlert.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/01/19.
//  Copyright © 2020年 WebersonGao. All rights reserved.
//

#import "UIAlertController+WKWebAlert.h"
#import "NSObject+DZRuntime.h"


@interface UIViewController (PAKit)

- (UIViewController *)ba_currentViewController;

@end

@implementation UIAlertController (WKWebAlert)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

+ (BOOL)isAlert{
    
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0)
            if ([[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]]
                || [[subviews objectAtIndex:0] isKindOfClass:[UIAlertController class]])
                return YES;
    }
    return NO;
}


+ (void)dz_AlertWithTitle:(NSString *)title message:(NSString *)message completion:(void (^)())completion
{
    UIAlertController*  showSecreetDefault = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ActionTrue = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nullable action) {
        completion ? completion() : NULL;
    }];
    
    [showSecreetDefault addAction:ActionTrue];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showSecreetDefault animated:YES completion:nil];
    });
}


+ (void)dz_AlertWithTitle:(NSString *)title
                message:(NSString *)message
           action1Title:(NSString *)action1Title
           action2Title:(NSString *)action2Title
                action1:(void (^)())action1
                action2:(void (^)())action2
{
    UIAlertController*  showSecreetDefault = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ActionOne = [UIAlertAction actionWithTitle:action1Title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        action1 ? action1() : NULL;
    }];
    UIAlertAction *ActionTwo = [UIAlertAction actionWithTitle:action2Title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        action2 ? action2() : NULL;
    }];
    [showSecreetDefault addAction:ActionOne];
    [showSecreetDefault addAction:ActionTwo];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showSecreetDefault animated:YES completion:nil];
    });
}



/**
 快速创建一个系统 普通 UIAlertController-ActionSheet
 
 @param viewController 显示的VC
 @param title title
 @param message message
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param popoverPresentationControllerBlock popoverPresentationControllerBlock description
 @param block block
 @return UIAlertController-ActionSheet
 */
+ (nonnull instancetype)dz_actionSheetShowInViewController:(nonnull UIViewController *)viewController
                                                     title:(nullable NSString *)title
                                                   message:(nullable NSString *)message
                                          buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                     buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
                        popoverPresentationControllerBlock:(nullable DQKit_UIAlertCtrlPopoverPresentationBlock)popoverPresentationControllerBlock
#endif
                                                     block:(nullable DQKit_AlertCtrlBtnActionBlock)block
{
    return [self ba_alertControllerShowInViewController:viewController title:title attributedTitle:nil message:message attributedMessage:nil preferredStyle:UIAlertControllerStyleActionSheet buttonTitleArray:buttonTitleArray buttonTitleColorArray:buttonTitleColorArray buttonEnabledNoWithTitleArray:nil textFieldPlaceholderArray:nil textFieldConfigurationActionBlock:nil
#if TARGET_OS_IOS
                     popoverPresentationControllerBlock:popoverPresentationControllerBlock
#endif
                                                  block:block];
}



+ (instancetype)ba_alertControllerShowInViewController:(UIViewController *)viewController
                                                 title:(NSString *)title
                                       attributedTitle:(nullable NSMutableAttributedString *)attributedTitle
                                               message:(NSString *)message
                                     attributedMessage:(nullable NSMutableAttributedString *)attributedMessage
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                      buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                 buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
                         buttonEnabledNoWithTitleArray:(NSArray <NSString *> *_Nullable)buttonEnabledNoWithTitleArray
                             textFieldPlaceholderArray:(NSArray <NSString *> *_Nullable)textFieldPlaceholderArray
                     textFieldConfigurationActionBlock:(nullable DQKit_AlertCtrlTextFieldConfigActionBlock)textFieldConfigurationActionBlock
#if TARGET_OS_IOS
                    popoverPresentationControllerBlock:(void(^)(UIPopoverPresentationController *popover))popoverPresentationControllerBlock
#endif
                                                 block:(DQKit_AlertCtrlBtnActionBlock)block
{
    UIAlertController *strongController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    __weak UIAlertController *weakAlertController = strongController;
    
    if (buttonTitleArray.count)
    {
        for (NSUInteger i = 0; i < buttonTitleArray.count; i++){
            
            NSString *buttonTitle = buttonTitleArray[i];
            UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                if (block){
                    block(weakAlertController, action, i);
                }
            }];
            [weakAlertController addAction:action];
            for (NSInteger j = 0; j < buttonEnabledNoWithTitleArray.count; j ++){
                if ([buttonEnabledNoWithTitleArray[j] isEqualToString:buttonTitle]){
                    action.enabled = NO;
                }
            }
            if (buttonTitleColorArray.count && buttonTitle.length && attributedTitle.length && attributedMessage.length)
            {
                [weakAlertController setAlertWithMutableAttributedTitle:attributedTitle mutableAttributedMessage:attributedMessage Action:action buttonTitleColor:buttonTitleColorArray[i]];
            }
        }
    }
    if (textFieldPlaceholderArray.count)
    {
        for (NSInteger i = 0; i < textFieldPlaceholderArray.count; i++){
            [weakAlertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = textFieldPlaceholderArray[i];
                if (textFieldConfigurationActionBlock){
                    textFieldConfigurationActionBlock(textField, i);
                }
            }];
        }
    }
    
    if (preferredStyle == UIAlertControllerStyleActionSheet){
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取 消" style:UIAlertActionStyleCancel handler:nil];
        [weakAlertController addAction:action];
    }
    
#if TARGET_OS_IOS
    if (popoverPresentationControllerBlock){
        popoverPresentationControllerBlock(weakAlertController.popoverPresentationController);
    }
#endif
    
    [viewController.ba_currentViewController presentViewController:weakAlertController animated:YES completion:nil];
    
    return weakAlertController;
}


- (void)setAlertWithMutableAttributedTitle:(NSMutableAttributedString *)mutableAttributedTitle
 mutableAttributedMessage:(nullable NSMutableAttributedString *)mutableAttributedMessage
                   Action:(UIAlertAction * __nonnull )action
         buttonTitleColor:(UIColor *)buttonTitleColor
{
    /*! 1、首先获得对应的属性 */
    //    NSArray *propertysListArray = [[UIAlertController class] ba_propertysList];
    //    KSLog(@"1、获取【UIAlertController】所有的属性名：%@", propertysListArray);
    
    /*! 2、获得成员变量 */
    NSArray *ivarListArray = [[UIAlertAction class] ba_ivarList];
    //    KSLog(@"2、获取【UIAlertController】所有的成员变量：%@", ivarListArray);
    
    for (NSInteger i = 0; i < ivarListArray.count; i++)
    {
        NSString *ivarName = ivarListArray[i];
        if ([ivarName isEqualToString:@"_titleTextColor"])
        {
            [action setValue:buttonTitleColor forKey:@"titleTextColor"];
        }
    }
    
    /*! 3、改变显示提示字体颜色 */
    NSArray *propertysListArray2 = [[UIAlertController class] ba_ivarList];
    //    KSLog(@"3、获取【UIAlertController】所有的成员变量：%@", propertysListArray2);
    for (NSInteger i = 0; i < propertysListArray2.count; i++)
    {
        NSString *ivarName = propertysListArray2[i];
        if ([ivarName isEqualToString:@"_attributedTitle"])
        {
            [self setValue:mutableAttributedTitle forKey:@"attributedTitle"];
        }
        if ([ivarName isEqualToString:@"_attributedMessage"])
        {
            [self setValue:mutableAttributedMessage forKey:@"attributedMessage"];
        }
    }
}

#pragma clang diagnostic pop

@end

@implementation UIViewController (PAKit)

- (UIViewController *)ba_currentViewController
{
    UIViewController *topVC = self;
    
    UIViewController *above;
    while ((above = topVC.presentedViewController)) {
        topVC = above;
    }
    
    return topVC;
}

@end


