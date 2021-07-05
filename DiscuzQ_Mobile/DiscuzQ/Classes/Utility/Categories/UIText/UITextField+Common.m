//
//  UITextField+Common.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/7/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UITextField+Common.h"

@implementation UITextField (Common)

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



- (void)placeHolder:(NSString *)placeHolder color:(UIColor * __nullable)color font:(UIFont * __nullable)font
{
    if (placeHolder) {
        
        NSMutableDictionary *setting = [NSMutableDictionary dictionaryWithCapacity:2];
        if (color) {
            [setting setObject:color forKey:NSForegroundColorAttributeName];
        }
        if (font) {
            [setting setObject:font forKey:NSFontAttributeName];
        }
        NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:checkTwoStr(@" ", placeHolder) attributes:setting];
        self.attributedPlaceholder = placeholderString;
    }

}





@end
