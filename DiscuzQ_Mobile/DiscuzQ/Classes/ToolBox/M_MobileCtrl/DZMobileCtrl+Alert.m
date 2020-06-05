//
//  DZMobileCtrl+Alert.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Alert.h"

@implementation DZMobileCtrl (Alert)

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


@end
