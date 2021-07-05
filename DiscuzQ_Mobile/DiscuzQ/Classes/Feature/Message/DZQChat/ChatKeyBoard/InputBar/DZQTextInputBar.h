//
//  DZQTextInputBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQChatBarButton.h"
#import "DZQChatEmotionModel.h"

NS_ASSUME_NONNULL_BEGIN

// 访问方式
typedef NS_ENUM(NSInteger,DZQHeightStyle) {
    DZQHeightZero =0, // 0
    DZQHeightMinus = -1,  // 负数
    DZQHeightWidget = DZQChatWidgetHeight, // 插件高度
};

@protocol DZQTextInputBarDelegate <NSObject>

// 发送文本
-(void)DZQTextInputBarSendText:(NSString *)textString;
// 输入框文本变化
-(void)DZQTextInputBarTextDidChange:(NSString *)changeString;
// 发送语音
-(void)DZQTextInputBarSendAudio:(NSData *)audioData time:(NSInteger)time;
// 高度更新
-(void)DZQTextInputBarUpdateHeight:(CGFloat)barHeight Status:(DZQKeyStatus)status;

@end

@interface DZQTextInputBar : UIButton

//当前点击的按钮  左侧按钮   表情按钮  添加按钮
@property(nonatomic,strong) UIButton *currentBtn;
@property (nonatomic, copy) NSString *textString;  //!< 属性注释

@property(nonatomic,assign)id<DZQTextInputBarDelegate>inDelegate;


-(void)chat_resetTextInputBarStatusWhenSendText;

- (void)chat_textInputViewDidChange:(NSObject *)emojiText;

@end

NS_ASSUME_NONNULL_END
