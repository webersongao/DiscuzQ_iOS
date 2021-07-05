//
//  DZAuthCodeView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/9/18.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZAuthCodeView : UIView

//验证码字符串
- (NSString *)authCode;

- (void)updateLocalAuthCode;

@end
