//
//  DZEmptyBaseView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+EMExtension.h"

//事件回调
typedef void (^DZActionTapBlock)(void);
typedef enum : NSUInteger {
    DZEmptyModeDefault,  /// 默认
    DZEmptyModeNoNet,  /// 无网
    DZEmptyModeNoData,  /// 无数据
    DZEmptyModeNoComment, /// 无 回复
    DZEmptyModeSystemError, /// 系统错误
} DZEmptyMode;

@interface DZEmptyBaseView : UIView

/////////属性传递(可修改)
/* image 的优先级大于 imageStr，只有一个有效*/
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *detailStr;
@property (nonatomic, copy) NSString *btnTitleStr;

/////////属性传递 (只读)
@property (nonatomic,strong,readonly) UIView *contentView;
@property (nonatomic, weak, readonly) id actionBtnTarget;
@property (nonatomic,assign,readonly) SEL actionBtnAction;
@property (nonatomic, copy, readonly) DZActionTapBlock btnClickBlock;
@property (nonatomic,strong,readonly) UIView *customView;

/**
 emptyView点击事件
 */
@property (nonatomic, copy) DZActionTapBlock tapEmptyViewBlock;


///初始化配置
- (void)prepare;

///重置Subviews
- (void)setupSubviews;


/**
 构造方法 - 创建emptyView
 
 @param image       占位图片
 @param titleStr    标题
 @param detailStr   详细描述
 @param btnTitleStr 按钮的名称
 @param target      响应的对象
 @param action      按钮点击事件
 @return 返回一个emptyView
 */
+ (instancetype)emptyActionViewWithImage:(UIImage *)image
                                titleStr:(NSString *)titleStr
                               detailStr:(NSString *)detailStr
                             btnTitleStr:(NSString *)btnTitleStr
                                  target:(id)target
                                  action:(SEL)action;

/**
 构造方法 - 创建emptyView
 
 @param image          占位图片
 @param titleStr       占位描述
 @param detailStr      详细描述
 @param btnTitleStr    按钮的名称
 @param btnClickBlock  按钮点击事件回调
 @return 返回一个emptyView
 */
+ (instancetype)emptyActionViewWithImage:(UIImage *)image
                                titleStr:(NSString *)titleStr
                               detailStr:(NSString *)detailStr
                             btnTitleStr:(NSString *)btnTitleStr
                           btnClickBlock:(DZActionTapBlock)btnClickBlock;

/**
 构造方法 - 创建emptyView
 
 @param imageStr    占位图片名称
 @param titleStr    标题
 @param detailStr   详细描述
 @param btnTitleStr 按钮的名称
 @param target      响应的对象
 @param action      按钮点击事件
 @return 返回一个emptyView
 */
+ (instancetype)emptyActionViewWithImageStr:(NSString *)imageStr
                                   titleStr:(NSString *)titleStr
                                  detailStr:(NSString *)detailStr
                                btnTitleStr:(NSString *)btnTitleStr
                                     target:(id)target
                                     action:(SEL)action;

/**
 构造方法 - 创建emptyView
 
 @param imageStr       占位图片名称
 @param titleStr       占位描述
 @param detailStr      详细描述
 @param btnTitleStr    按钮的名称
 @param btnClickBlock  按钮点击事件回调
 @return 返回一个emptyView
 */
+ (instancetype)emptyActionViewWithImageStr:(NSString *)imageStr
                                   titleStr:(NSString *)titleStr
                                  detailStr:(NSString *)detailStr
                                btnTitleStr:(NSString *)btnTitleStr
                              btnClickBlock:(DZActionTapBlock)btnClickBlock;

/**
 构造方法 - 创建emptyView
 
 @param image         占位图片
 @param titleStr      占位描述
 @param detailStr     详细描述
 @return 返回一个没有点击事件的emptyView
 */
+ (instancetype)emptyViewWithImage:(UIImage *)image
                          titleStr:(NSString *)titleStr
                         detailStr:(NSString *)detailStr;

/**
 构造方法 - 创建emptyView
 
 @param imageStr      占位图片名称
 @param titleStr      占位描述
 @param detailStr     详细描述
 @return 返回一个没有点击事件的emptyView
 */
+ (instancetype)emptyViewWithImageStr:(NSString *)imageStr
                             titleStr:(NSString *)titleStr
                            detailStr:(NSString *)detailStr;

/**
 构造方法 - 创建一个自定义的emptyView
 
 @param customView 自定义view
 @return 返回一个自定义内容的emptyView
 */
+ (instancetype)emptyViewWithCustomView:(UIView *)customView;


@end
