//
//  DZResetPwdView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/7/17.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZResetPwdView.h"

@interface DZResetPwdView ()<UITextFieldDelegate>

@end

@implementation DZResetPwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_ResetPwdView];
    }
    return self;
}

- (void)config_ResetPwdView {
 
    self.firstField.inputDelegate = self;
    [self.firstField updateTextIcon:KImageNamed(@"log_p") placeholder:@"旧密码"];

    self.secendField.inputDelegate = self;
    [self.secendField updateTextIcon:KImageNamed(@"log_p") placeholder:@"新密码"];

    self.thirdField.hidden = NO;
    self.thirdField.inputDelegate = self;
    [self.secendField updateTextIcon:KImageNamed(@"log_r") placeholder:@"重复密码"];

    self.regContentView.height = CGRectGetMaxY(self.thirdField.frame);
    self.actionButton.top = self.regContentView.bottom + kMargin50;
    [self.actionButton setTitle:@"提 交" forState:UIControlStateNormal];
    

//    CGFloat maxHeight = MAX(self.height, CGRectGetMaxY(self.thirdLoginView.frame) + kToolBarHeight);
//    self.contentSize = CGSizeMake(self.width, maxHeight);
    
}



@end
