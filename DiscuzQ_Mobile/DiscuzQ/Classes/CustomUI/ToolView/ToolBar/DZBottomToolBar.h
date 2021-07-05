//
//  DZBottomToolBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/8/12.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    toolBar_comment,   /// 底部 评论
    toolBar_upload,  // 底部 上传
    toolBar_transfer,   // 底部 传输
    toolBar_naviAction,  // 顶部的操作条
} toolBarMode;


@interface DZBottomToolBar : UIButton

@property (nonatomic, assign, readonly) toolBarMode mode;  //!< 属性注释
@property (nonatomic, copy) backButtonBlock rightBlock;  //!< 右侧按钮事件  默认为全选按钮 有selected状态
@property (nonatomic, copy) backButtonBlock leftMainBlock;  //!< 左侧 或 唯一按钮 点击事件

@property (nonatomic, copy) backButtonBlock centerBlock;  //!< 中间按钮 点击事件

@property (nonatomic, assign,getter=isRightSelected) BOOL rightSelected;  //!< 属性注释

- (instancetype)initWithFrame:(CGRect)frame Mode:(toolBarMode)Mode;

-(void)showBottomToolBar:(BOOL)bShow;

-(void)updateDetailBottomBar:(DZQDataPost *)Post;

// 更新选中数量
-(void)updateNaviEditBar:(NSInteger)selectedNo;

// 更新左侧按钮文字
-(void)updateNaviLeftTitle:(NSString *)leftTitle;
    
    
/**
 底部提示条
 @param alertString 提示文字
 */
-(void)updateTransferAlert:(NSString *)alertString button:(int)buttonTag;



@end


