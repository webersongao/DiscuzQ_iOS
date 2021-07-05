//
//  DZEditTextView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    edit_None,
    edit_Article,
} editBarStyle;

@interface DZEditTextView : UITextView

- (void)updatePlaceHolderLabelToCenter;

- (instancetype)initWithFrame:(CGRect)frame barStyle:(editBarStyle)barStyle;

- (void)placeTextHolder:(NSString *)placeHolder color:(UIColor * __nullable)color font:(UIFont * __nullable)font;




@end
