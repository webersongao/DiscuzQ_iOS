//
//  DZWebOAuthView.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/6.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZWebOAuthView : UIView

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, copy) void(^refreshAuthCodeBlock)(void);


-(void)loadRequestWithCodeUrl:(NSString *)urlString;

@end
