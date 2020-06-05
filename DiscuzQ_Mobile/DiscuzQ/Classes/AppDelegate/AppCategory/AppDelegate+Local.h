//
//  AppDelegate+Local.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//  启动 位置定位

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate (Local)<CLLocationManagerDelegate>

- (void)useLocal;

@end
