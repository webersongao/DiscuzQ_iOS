//
//  DZEditTextView.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    edit_None,
    edit_Article,
} editBarStyle;

@interface DZEditTextView : UITextView<UITextViewDelegate>

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;


- (instancetype)initWithFrame:(CGRect)frame barStyle:(editBarStyle)barStyle;

@end
