//
//  DZBaseMoreMenu.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/01/19.
//  Copyright © 2020年 WebersonGao. All rights reserved.
//

#import "DZBaseMoreMenu.h"

NS_ASSUME_NONNULL_BEGIN

@implementation DZBaseMoreMenu

+ (instancetype)shareInstance{
    
    static DZBaseMoreMenu *menu = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menu = [[DZBaseMoreMenu alloc]init];
    });
    return menu;
}

- (void)defaultMenuShowInViewController:(nonnull UIViewController *)viewController
                                                  title:(nullable NSString *)title
                                                message:(nullable NSString *)message
                                       buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                  buttonTitleColorArray:(nullable NSArray<UIColor *> *)buttonTitleColorArray
                     popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                                  block:(nullable BAKit_AlertControllerButtonActionBlock)block
{
    
    [UIAlertController ba_actionSheetShowInViewController:viewController
                                                    title:title
                                                  message:message
                                         buttonTitleArray:buttonTitleArray
                                    buttonTitleColorArray:buttonTitleColorArray
                       popoverPresentationControllerBlock:popoverPresentationControllerBlock
                                                    block:block];
    
}

- (void)customMenuShowInViewController:(UIViewController *)viewController
                                 title:(nullable NSString *)title
                               message:(nullable NSString *)message
                      buttonTitleArray:(nullable NSArray *)buttonTitleArray
                 buttonTitleColorArray:(nullable NSArray<UIColor *> *)buttonTitleColorArray
    popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
                                 block:(nullable BAKit_AlertControllerButtonActionBlock)block{
    [UIAlertController ba_actionSheetShowInViewController:viewController
                                                    title:title
                                                  message:message
                                         buttonTitleArray:buttonTitleArray
                                    buttonTitleColorArray:buttonTitleColorArray
                       popoverPresentationControllerBlock:popoverPresentationControllerBlock
                                                    block:block];
    
}


@end

NS_ASSUME_NONNULL_END
