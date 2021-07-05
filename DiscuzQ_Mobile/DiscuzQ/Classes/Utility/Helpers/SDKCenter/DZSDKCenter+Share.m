//
//  DZSDKCenter+Share.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSDKCenter+Share.h"

@implementation DZSDKCenter (Share)


- (void)shareText:(nonnull NSString *)text andImages:(nullable id)images andUrlstr:(nonnull NSString *)urlStr andTitle:(nonnull NSString *)title andView:(nullable UIView *)view andHUD:(nullable MBProgressHUD *)HUD {
    
    /*
     NSMutableDictionary *shareParems = [NSMutableDictionary dictionary];
     [shareParems SSDKSetupShareParamsByText:text images:images url:[NSURL URLWithString:urlStr] title:title type:SSDKContentTypeAuto];
     NSMutableArray *activePlatforms = [NSMutableArray arrayWithArray:[ShareSDK activePlatforms]];
     SSUIShareSheetConfiguration *config = [[SSUIShareSheetConfiguration alloc] init];
     config.style = ShareActionSheetStyleSimple;
     [ShareSDK showShareActionSheet:view customItems:activePlatforms shareParams:shareParems sheetConfiguration:config onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
     switch (state) {
     case SSDKResponseStateBegin: {
     //                if (view != nil && HUD != nil) {
     //                    [Utils showHUD:@"分享中" andView:view andHUD:HUD];
     //                }
     break;
     }
     case SSDKResponseStateSuccess: {
     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
     message:nil
     delegate:nil
     cancelButtonTitle:@"确定"
     otherButtonTitles:nil];
     [alertView show];
     break;
     }
     case SSDKResponseStateFail: {
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
     message:[NSString stringWithFormat:@"%@",error]
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil, nil];
     [alert show];
     break;
     }
     case SSDKResponseStateCancel: {
     if (view != nil && HUD != nil) {
     [HUD hideAnimated:YES];
     }
     break;
     }
     default:
     break;
     }
     if (state != SSDKResponseStateBegin) {
     if (view != nil && HUD != nil) {
     [HUD hideAnimated:YES];
     }
     
     }
     }];
     */
}





@end
