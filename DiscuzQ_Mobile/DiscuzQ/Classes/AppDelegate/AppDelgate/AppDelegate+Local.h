//
//  DZQDelegate+Local.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//  启动 位置定位

#import "DZQDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface DZQDelegate (Local)<CLLocationManagerDelegate>

- (void)useLocal;

@end
