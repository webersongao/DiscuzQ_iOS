//
//  DZUserRegisterView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/1/11.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZUserRegisterView.h"

@interface DZUserRegisterView ()<UITextFieldDelegate>

@end

@implementation DZUserRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_setupRegViews];
    }
    return self;
}

- (void)config_setupRegViews {
    
    self.firstField.inputDelegate = self;
    
    self.secendField.inputDelegate = self;
    
    self.thirdField.hidden = NO;
    self.thirdField.inputDelegate = self;
    
    self.regContentView.height = CGRectGetMaxY(self.thirdField.frame);
    self.actionButton.top = self.regContentView.bottom + kMargin50;
    
    [self addSubview:self.usertermsView];
    
    CGFloat maxHeight = MAX(self.height, CGRectGetMaxY(self.usertermsView.frame) + kToolBarHeight);
    self.contentSize = CGSizeMake(self.width, maxHeight);
}

#pragma mark   /*************** 初始化 ***************/

-(DZTermsLabel *)usertermsView{
    if (!_usertermsView) {
        _usertermsView = [[DZTermsLabel alloc] initWithFrame:CGRectMake(self.actionButton.left, self.actionButton.bottom + 10, self.actionButton.width, 44)];
    }
    return _usertermsView;
}







@end
