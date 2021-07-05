//
//  DZWebOAuthView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/6.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZScaleView.h"

@interface DZWebOAuthView : DZScaleView

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, copy) void(^refreshAuthCodeBlock)(void);


-(void)loadRequestWithCodeUrl:(NSString *)urlString;

@end
