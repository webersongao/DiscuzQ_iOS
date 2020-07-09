//
//  DZMobileCtrl+Alert.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Alert.h"
#import "TipHubViewManager.h"

@implementation DZMobileCtrl (Alert)

#pragma mark   /********************* 基本工具 *************************/


void ShowTipHubViewWithText(NSString *message, float second, UIView* inView, int showType , CGRect rect)
{
    [TipHubViewManager showTipHubViewWithText:message inView:inView hideTime:second showType:showType starttype:TipHubViewAnimationType_frame endtype:TipHubViewAnimationType_frame rect:rect];
}

void ShowTipHubViewWithText(NSString *message, float second, UIView* inView, int showType)
{
    ShowTipHubViewWithText(message,second,inView,showType,inView.frame);
}

void ShowTipHubViewWithText(NSString *message, float second, UIView* inView)
{
    ShowTipHubViewWithText(message,second,inView,TipHubView_Show_Type_Mid);
}

void MsgBox_Type(NSString *message, TipHubView_Show_Type show_Type){
    int showType = show_Type;
    MsgBox(message, showType);
}

void MsgBox(NSString *message, int showType)
{
    UIView* inView = nil;
    ShowTipHubViewWithText(checkNull(message),2.5,inView,showType);
}

void MsgBox(NSString *message)
{
    MsgBox(message,TipHubView_Show_Type_Mid);
}

void MsgBoxNoClick(NSString *message)
{
    ShowTipHubViewWithText(message, 2.5,nil);
}




+ (void)showAlertError:(NSString *)error{
    NSString * message = checkNull(error);
    if (message.length) {
        [MBProgressHUD showError:message];
    }
}

+ (void)showAlertSuccess:(NSString *)success{
    NSString * message = checkNull(success);
    if (message.length) {
        [MBProgressHUD showSuccess:message];
    }
}

+ (void)showAlertWarn:(NSString *)warn{
    NSString * message = checkNull(warn);
    if (message.length) {
        [MBProgressHUD showWarn:message];
    }
}

+ (void)showAlertInfo:(NSString *)info{
 NSString * message = checkNull(info);
    if (message.length) {
        [MBProgressHUD showInfo:message];
    }
}

+ (void)showMessage:(NSString *)message
{
    MsgBox(message);
}






@end
