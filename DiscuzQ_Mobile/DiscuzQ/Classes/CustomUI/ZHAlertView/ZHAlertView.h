//
//  ZHAlertView.h
//  ZongHeng
//
//  Created by 王充 on 17/9/29.
//  Copyright © 2015年 李贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KAlertTag 17371
typedef void(^RightBlockAction)(void);
typedef void(^LeftBlockAction)(void);
typedef void(^DismissBlockAction)(void);


@interface ZHAlertView : UIView

/// 高度自适应 不限制 contentText 文字长度
- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle;

- (void)show;
- (void)mustShow;
- (void)showInView:(UIView *)view;

#pragma mark - 用于书封书籍过多的弹框
- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
     contentTipText:(NSString *)tipText
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle;

- (BOOL)contentTipStatus;
- (void)setTipDefaultSelect:(BOOL)select;

@property (nonatomic, copy) LeftBlockAction leftBlock;
@property (nonatomic, copy) RightBlockAction rightBlock;
@property (nonatomic, copy) DismissBlockAction dismissBlock;

@property (nonatomic, assign ,getter=isHaveCancel) BOOL haveCancel;
@end

@interface UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
