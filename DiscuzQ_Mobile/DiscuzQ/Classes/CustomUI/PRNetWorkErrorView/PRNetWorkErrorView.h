//
//  PRNetWorkErrorView.h
//  NetWorkError-demo
//
//  Created by Gao on 16/6/20.
//  Copyright © 2016年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const PRErrorViewDefaultNoNetTextString;
UIKIT_EXTERN NSString *const PRErrorViewDefaultNoNetButtonTitle;

UIKIT_EXTERN NSString *const PRErrorViewDefaultNoDataTextString;

typedef NS_ENUM(NSUInteger, PRErrorViewType) {
    PRErrorViewNoNet,
    PRErrorViewNoData,
};

/**
 *  点击重试按钮代理
 */
@protocol PRNetWorkErrorViewDelegate <NSObject>
@optional
- (void)tryAgainButtonDidClicked;

@end


/**
 *  加载错误页面
 */
@interface PRNetWorkErrorView : UIView

/**
 *  图片
 */
@property (nonatomic, strong) NSString  *imageName;

/**
 *  主提示标题
 */
@property (nonatomic, strong) NSString	*textString;

/**
 *  副提示标题
 */
@property (nonatomic, strong) NSString	*detailTextString;

/**
 * 重试按钮
 */
@property (nonatomic, strong) UIButton *button;

/**
 *  是否隐藏重试按钮 默认:NO 显示重试按钮
 */
@property (nonatomic, assign) BOOL	hiddenButton;

/**
 *  按钮标题 默认:再试一次
 */
@property (nonatomic, strong) NSString *buttonTitle;

/**
 *  代理对象
 */
@property (nonatomic, weak) id<PRNetWorkErrorViewDelegate> delegate;

@property (nonatomic, assign, readonly) PRErrorViewType errorType;

- (instancetype)initWithFrame:(CGRect)frame viewType:(PRErrorViewType)type;

- (void)addErrorViewWithViewType:(PRErrorViewType)viewType;
- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)textString;
- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)textString detailTextSting:(NSString *)detailTextSting buttonTitle:(NSString *)buttonTitle;
- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)textString detailTextSting:(NSString *)detailTextSting buttonTitle:(NSString *)buttonTitle imageName:(NSString *)imageName;

- (void)updateImageViewForType:(PRErrorViewType)viewType;

-(void)checkTitleAndSubTitleToCenter;

@end
