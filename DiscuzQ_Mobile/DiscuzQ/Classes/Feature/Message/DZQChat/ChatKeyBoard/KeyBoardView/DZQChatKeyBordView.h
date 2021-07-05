//
//  DZQChatKeyBordView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZQChatKeyHeader.h"
#import "DZQChatEmotionView.h"
#import "DZQChatWidgetView.h"


/**
 多功能界面+表情视图的承载视图
 */

@protocol DZQChatKeyBordViewDelegate <NSObject>

//点击其他按钮
-(void)DZQChatKeyBordViewBtnClick:(NSInteger)index type:(DZQKeyBordFuncType)type;

//点击表情
-(void)DZQChatEmotionViewBtnClick:(NSObject *)emojiText;

@end

@interface DZQChatKeyBordView : UIView<UIScrollViewDelegate,DZQChatEmotionViewDelegate,DZQChatWidgetViewDelegate>

@property(nonatomic,assign)id<DZQChatKeyBordViewDelegate>delegate;

//弹窗界面是表情还是其他功能
@property(nonatomic,assign)DZQKeyBordFuncType type;
//表情视图
@property(nonatomic,strong)DZQChatEmotionView *emotionView;
//多功能视图
@property(nonatomic,strong)DZQChatWidgetView *functionView;

@end






