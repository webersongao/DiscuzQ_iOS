//
//  DZMobileCtrl+Alert.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

@interface DZMobileCtrl (Alert)


+ (void)showAlertError:(NSString *)error;

+ (void)showAlertSuccess:(NSString *)success;

+ (void)showAlertWarn:(NSString *)warn;

+ (void)showAlertInfo:(NSString *)info;



@end

