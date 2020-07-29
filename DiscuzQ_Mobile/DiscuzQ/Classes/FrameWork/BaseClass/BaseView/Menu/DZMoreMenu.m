//
//  DZMoreMenu.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/01/19.
//  Copyright © 2020年 WebersonGao. All rights reserved.
//

#import "DZMoreMenu.h"

NS_ASSUME_NONNULL_BEGIN

@implementation DZMoreMenu

+ (instancetype)sharedMenu{
    
    static DZMoreMenu *menu = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menu = [[DZMoreMenu alloc]init];
    });
    return menu;
}

- (void)showSheetMenuInViewCtrl:(nonnull UIViewController *)viewController
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

-(void)showListCellPopMenu:(UIView *)sender titleArray:(NSArray *)titleArray imageArray:(NSArray *)imageArray doneBlock:(backIntegerBlock)doneBlock dismissBlock:(backNoneBlock)dismissBlock{
    
    FTPopOverMenuConfiguration *config = [FTPopOverMenuConfiguration defaultConfiguration];
    config.borderColor = UIColor.whiteColor;
    [FTPopOverMenu showForSender:sender withMenuArray:titleArray imageArray:imageArray configuration:config doneBlock:^(NSInteger selectedIndex) {
        if (doneBlock) {
            doneBlock(selectedIndex);
        }
    } dismissBlock:^{
        if (dismissBlock) {
            dismissBlock();
        }
    }];
}

/// 导航条文字菜单按钮（两三个字）
-(void)showNaviBarPopTextMenu:(UIView *)sender titleArray:(NSArray<NSString *> *)titleArray doneBlock:(backIntegerBlock)doneBlock dismissBlock:(backNoneBlock)dismissBlock{
    
    FTPopOverMenuConfiguration *config = [FTPopOverMenuConfiguration defaultConfiguration];
    config.menuWidth = 80;
    config.textAlignment = NSTextAlignmentCenter;
    config.separatorInset = UIEdgeInsetsMake(0, 15.f, 0, 15.f);
    [FTPopOverMenu showForSender:sender withMenuArray:titleArray imageArray:nil configuration:config doneBlock:^(NSInteger selectedIndex) {
        if (doneBlock) {
            doneBlock(selectedIndex);
        }
    }dismissBlock:^{
        if (dismissBlock) {
            dismissBlock();
        }
    }];
}

-(void)showNaviBarPopMenu:(UIView *)sender menuArray:(NSArray<FTPopOverMenuModel *> *)menuArray doneBlock:(backIntegerBlock)doneBlock dismissBlock:(backNoneBlock)dismissBlock{
    
    FTPopOverMenuConfiguration *config = [FTPopOverMenuConfiguration defaultConfiguration];
    config.backgroundColor = UIColor.redColor;
    config.coverBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    config.menuCornerRadius = 10.f;
    config.separatorInset = UIEdgeInsetsMake(0, 15.f, 0, 15.f);
    config.selectedCellBackgroundColor = [UIColor yellowColor];
    //    config.imageSize = CGSizeMake(16.f, 16.f);
    config.horizontalMargin = 10.f;
    [FTPopOverMenu showForSender:sender withMenuArray:menuArray imageArray:nil configuration:config doneBlock:^(NSInteger selectedIndex) {
        if (doneBlock) {
            doneBlock(selectedIndex);
        }
    }dismissBlock:^{
        if (dismissBlock) {
            dismissBlock();
        }
    }];
}

@end

NS_ASSUME_NONNULL_END
