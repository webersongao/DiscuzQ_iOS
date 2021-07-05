//
//  DZShadowAlertManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/27.
//  专门负责弹窗 你给一个View 我就给你弹个窗

#import <Foundation/Foundation.h>
#import "DZScaleView.h"

@interface DZShadowAlertManager : NSObject

+ (instancetype)sharedManager;

/**
 移除弹窗
 */
-(void)dismissScaleAlertView;

/**
 展示弹窗
 
 @param alertView 需要展示的弹窗（设计好Frame 必须继承自 DZScaleView）
 @param bDisdimiss 点击 弹窗外部的空白区域 是否关闭弹窗
 */
-(void)showScaleAlertView:(DZScaleView *)alertView bDismiss:(BOOL)bDisdimiss;


-(void)updateAlertViewSize:(CGSize)viewSize;



@end
