//
//  TipHubViewManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TipHubView.h"

@interface TipHubViewManager : NSObject

+ (void)closeTipHubView;
+ (void)showTipHubViewWithText:(NSString*)text inView:(UIView*)inView hideTime:(float)time showType:(int)type starttype:(TipHubViewAnimationType)startype endtype:(TipHubViewAnimationType)endtype;
+ (void)showTipHubViewWithText:(NSString*)text inView:(UIView*)inView hideTime:(float)time showType:(int)type starttype:(TipHubViewAnimationType)starttype endtype:(TipHubViewAnimationType)endtype rect:(CGRect)viewRect;
+ (void)showNextHubView;
+ (TipHubView *)staticTipHubView;
+ (void)setStaticTipHubView:(TipHubView *)view;

+ (UIColor*)getTipBgColor;
@end
