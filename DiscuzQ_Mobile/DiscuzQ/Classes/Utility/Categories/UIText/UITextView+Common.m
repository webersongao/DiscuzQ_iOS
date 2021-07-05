//
//  UITextView+Common.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/7/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UITextView+Common.h"

@implementation UITextView (Common)

- (BOOL)isEmoji {
    KSLog(@"...%@",[self.textInputMode primaryLanguage]);
    if ([self.textInputMode primaryLanguage] == nil || [[self.textInputMode primaryLanguage] isEqualToString:@"emoji"]) {
        if ([DZMonitorKeyboard Shared].showKeyboard) {
            KSLog(@"输入的是表情...");
            [MBProgressHUD showInfo:@"不支持使用emoji表情"];
            return YES;
        }
    }
    
    KSLog(@"输入的不是表情...");
    return NO;
}



@end
