//
//  UITextView+EmojiCheck.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UITextView+EmojiCheck.h"

@implementation UITextView (EmojiCheck)
- (BOOL)isEmoji {
    KSLog(@"...%@",[self.textInputMode primaryLanguage]);
    if ([self.textInputMode primaryLanguage] == nil || [[self.textInputMode primaryLanguage] isEqualToString:@"emoji"]) {
        if ([DZMonitorKeyboard shareInstance].showKeyboard) {
            KSLog(@"输入的是表情...");
            [MBProgressHUD showInfo:@"不支持使用emoji表情"];
            return YES;
        }
    }
    
    KSLog(@"输入的不是表情...");
    return NO;
}
@end
