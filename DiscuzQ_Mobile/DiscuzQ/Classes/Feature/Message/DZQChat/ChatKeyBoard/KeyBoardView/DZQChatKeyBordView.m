//
//  DZQChatKeyBordView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatKeyBordView.h"

@implementation DZQChatKeyBordView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = KLightGray_Color;
        [self addSubview:self.emotionView];
        [self addSubview:self.functionView];
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 0.5)];
        topLine.backgroundColor = KLine_Color;
        [self addSubview:topLine];
        self.clipsToBounds = YES;
        self.type = DZQKeyBordFunc_Add;
    }
    return self;
}

//表情视图  其他功能视图
-(void)setType:(DZQKeyBordFuncType)type{
    
    if(_type == type)return;
    _type = type;
    
    UIView *aniView = (type == DZQKeyBordFunc_Symbol) ? self.emotionView : self.functionView;
    UIView *aniOtherView = (type == DZQKeyBordFunc_Symbol) ? self.functionView : self.emotionView;
    
    aniView.hidden = NO;
    aniView.top = self.height;
    aniOtherView.hidden = YES;
    [UIView animateWithDuration:0.25 animations:^{
        aniView.top = 0;
    } completion:^(BOOL finished) {
        
    }];
    
}



#pragma DZQChatEmotionViewDelegate 发送200
-(void)DZQChatEmotionViewBtnAction:(NSInteger)index{
    [self DZQChatKeyBordButtonPressed:index];
}

//表情点击回调
-(void)DZQChatKeyBordSymbolCellClick:(NSObject *)emojiString{
    if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatEmotionViewBtnClick:)]){
        [self.delegate DZQChatEmotionViewBtnClick:emojiString];
    }
}

#pragma DZQChatKeyBordFunctionDelegate  其他功能按钮点击回调 500+
-(void)DZQChatWidgetViewBtnClick:(NSInteger)index{
    [self DZQChatKeyBordButtonPressed:index];
}



//发送200  多功能点击10+
-(void)DZQChatKeyBordButtonPressed:(NSInteger)index{
    if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatKeyBordViewBtnClick:type:)]){
        [self.delegate DZQChatKeyBordViewBtnClick:index type:self.type];
    }
}



-(DZQChatEmotionView *)emotionView{
    if (!_emotionView) {
        CGRect visibleRect = CGRectMake(0, 0, self.width, self.height - KTabbar_Gap);
        _emotionView = [[DZQChatEmotionView alloc]initWithFrame:visibleRect];
        _emotionView.delegate = self;
        _emotionView.userInteractionEnabled = YES;
    }
    return _emotionView;
}

-(DZQChatWidgetView *)functionView{
    if (!_functionView) {
        CGRect visibleRect = CGRectMake(0, 0, self.width, self.height - KTabbar_Gap);
        _functionView = [[DZQChatWidgetView alloc]initWithFrame:visibleRect];
        _functionView.delegate = self;
        _functionView.userInteractionEnabled = YES;
    }
    return _functionView;
}

@end
