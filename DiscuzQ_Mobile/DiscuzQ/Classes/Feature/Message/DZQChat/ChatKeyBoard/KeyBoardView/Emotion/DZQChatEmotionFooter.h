//
//  DZQChatEmotionFooter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 表情视图底部发送和表情筛选部分
#define DZQChatEmotionFooterH  40

@protocol DZQChatEmotionFooterDelegate <NSObject>

-(void)DZQChatEmotionFooterBtnClick:(UIButton *)sender;

@end

@interface DZQChatEmotionFooter : UIView

@property(nonatomic,assign)id<DZQChatEmotionFooterDelegate>delegate;

//表情切换的滚动视图(其实没有很多，为了能拓展就用这个吧)
@property (nonatomic,strong)UIScrollView *emojiFooterScrollView;
//发送按钮
@property (nonatomic,strong)UIButton *sendButton;
//第一类表情 第二类表情
@property (nonatomic,strong)UIButton *mButton1,*mButton2;

@end

NS_ASSUME_NONNULL_END
