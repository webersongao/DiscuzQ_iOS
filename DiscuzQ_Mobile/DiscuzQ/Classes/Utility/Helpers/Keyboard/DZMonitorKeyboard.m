//
//  DZMonitorKeyboard.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/7/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMonitorKeyboard.h"

@implementation DZMonitorKeyboard
+ (instancetype)Shared {
    static dispatch_once_t onceToken;
    static DZMonitorKeyboard *sharedMonitor;
    dispatch_once(&onceToken, ^{
        if (!sharedMonitor) {
            sharedMonitor = [[DZMonitorKeyboard alloc] init];
            NSNotificationCenter *nf = [NSNotificationCenter defaultCenter];
            [nf addObserver:sharedMonitor selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
            [nf addObserver:sharedMonitor selector:@selector(keyboardDidHide) name:UIKeyboardWillHideNotification object:nil];
            sharedMonitor.showKeyboard = NO;
        }});
    return sharedMonitor;
    
}

- (void)keyboardDidShow {
    _showKeyboard = YES;
}

- (void)keyboardDidHide {
    _showKeyboard = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
