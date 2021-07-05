//
//  DZTextField.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/9/17.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZTextField : UIView

@property (nonatomic) id inputDelegate;
@property (nonatomic,copy,readonly) NSString *inputString;


- (void)updateInputtag:(NSInteger)tag secureTextEntry:(BOOL)secureTextEntry;

- (void)updateTextIcon:(UIImage *)leftImg placeholder:(NSString *)placeholder;

- (instancetype)initWithFrame:(CGRect)frame Left:(UIImage *)leftImg placeholder:(NSString *)placeholder;



@end
