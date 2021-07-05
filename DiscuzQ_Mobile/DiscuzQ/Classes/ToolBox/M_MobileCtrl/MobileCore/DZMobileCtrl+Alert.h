//
//  DZMobileCtrl+Alert.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

@interface DZMobileCtrl (Alert)


+ (void)showAlertError:(NSString *)error;

+ (void)showAlertSuccess:(NSString *)success;

+ (void)showAlertWarn:(NSString *)warn;

+ (void)showAlertInfo:(NSString *)info;

+ (void)showMessage:(NSString *)message;

+ (void)showLoadingAlert;

+ (void)hideLoadingAlert;

- (void)showCaptchaAuthWithCompletion:(void (^)(NSDictionary *verDict,DZState *state))completion;



@end

