//
//  UIAlertController+WKWebAlert.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/01/19.
//  Copyright © 2020年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 按钮点击事件 block
 
 @param alertController alertController
 @param action UIAlertAction
 @param buttonIndex buttonIndex
 */
typedef void (^DQKit_AlertCtrlBtnActionBlock) (UIAlertController * __nonnull alertController, UIAlertAction * __nonnull action, NSInteger buttonIndex);

#if TARGET_OS_IOS
typedef void (^DQKit_UIAlertCtrlPopoverPresentationBlock) (UIPopoverPresentationController * __nonnull popover);
#endif

typedef void (^DQKit_AlertCtrlTextFieldConfigActionBlock)(UITextField * _Nullable textField, NSInteger index);

@interface UIAlertController (WKWebAlert)

+ (BOOL)isAlert;
/**
 *  返回当前类的所有成员变量数组
 *
 *  @return 当前类的所有成员变量！
 *
 *  Tips：用于调试, 可以尝试查看所有不开源的类的ivar
 */
+ (NSArray *)ba_ivarList;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

+ (void)dz_AlertWithTitle:(NSString *)title message:(NSString *)message completion:(void (^)())completion;
+ (void)dz_AlertWithTitle:(NSString *)title
                message:(NSString *)message
           action1Title:(NSString *)action1Title
           action2Title:(NSString *)action2Title
                action1:(void (^)())action1
                action2:(void (^)())action2;



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
+ (nonnull instancetype)dz_actionSheetShowInViewController:(nonnull UIViewController *)viewController title:(nullable NSString *)title message:(nullable NSString *)message buttonTitleArray:(nullable NSArray *)buttonTitleArray buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
                        popoverPresentationControllerBlock:(nullable DQKit_UIAlertCtrlPopoverPresentationBlock)popoverPresentationControllerBlock
#endif
                                                     block:(nullable DQKit_AlertCtrlBtnActionBlock)block;


#pragma clang diagnostic pop

@end
