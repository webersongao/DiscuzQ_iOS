//
//  DZQChatKeyBoardBar.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQChatKeyHeader.h"

@class DZQChatKeyBoardBar;
@protocol DZQChatKeyBoardBarDelegate <NSObject>

//改变输入框的高度 并让控制器弹出键盘
-(void)DZQChatKeyBoardBarSize:(CGSize)keySize duration:(CGFloat)duration;

//发送文本信息
-(void)DZQChatKeyBoardBarSendText:(NSString *)textString;

//发送语音消息 (秒)
- (void)DZQChatKeyBoardBarSendAudio:(NSData *)voice time:(NSInteger)time;

//多功能视图按钮点击回调
-(void)DZQChatKeyBoardBarFunction:(NSInteger)index;

@end


@interface DZQChatKeyBoardBar : UIView

@property(nonatomic,assign)id<DZQChatKeyBoardBarDelegate>delegate;



//键盘归位
-(void)resetChatKeyBoardInputViewEndEditing;


@end







