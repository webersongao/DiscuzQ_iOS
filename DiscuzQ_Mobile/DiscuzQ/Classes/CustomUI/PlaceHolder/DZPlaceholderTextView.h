//
//  DZPlaceholderTextView.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZPlaceholderTextView : UITextView<UITextViewDelegate>

@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, copy) NSString *placeholder;

@end
