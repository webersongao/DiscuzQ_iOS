//
//  DZQChatEmotionFooter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatEmotionFooter.h"

//表情视图底部发送和表情筛选部分
@implementation DZQChatEmotionFooter

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.sendButton];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.emojiFooterScrollView];
        [self.emojiFooterScrollView addSubview:self.mButton1];
        [self.emojiFooterScrollView addSubview:self.mButton2];
    }
    return self;
}


//发送200  表情包切换500+
-(void)buttonPressed:(UIButton *)sender{
    KSLog(@"点击了发送");
    if(_delegate && [_delegate respondsToSelector:@selector(DZQChatEmotionFooterBtnClick:)]){
        [_delegate DZQChatEmotionFooterBtnClick:sender];
    }
}


-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _sendButton .frame = CGRectMake(kScreenWidth-80, 0, 80, self.height);
        _sendButton.tag = 200;
        _sendButton.backgroundColor = KLightGray_Color;
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton setTitleColor:KGreen_Color forState:UIControlStateNormal];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _sendButton.enabled = NO;
        [_sendButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

-(UIScrollView *)emojiFooterScrollView{
    if (!_emojiFooterScrollView) {
        _emojiFooterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - self.sendButton.width, self.height)];
        _emojiFooterScrollView.showsHorizontalScrollIndicator = NO;
        _emojiFooterScrollView.showsVerticalScrollIndicator = NO;
        _emojiFooterScrollView.contentSize = CGSizeMake(kScreenWidth - self.sendButton.width+1,  self.height);
    }
    return _emojiFooterScrollView;
}


-(UIButton *)mButton1{
    if (!_mButton1) {
        _mButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / 6, 40)];
        _mButton1.tag = 500;
        _mButton1.selected = YES;
        [_mButton1 setImage:[UIImage imageNamed:@"Expression_1"] forState:UIControlStateNormal];
        [_mButton1 setImage:[UIImage imageNamed:@"Expression_13"] forState:UIControlStateSelected];
        [_mButton1 setBackgroundImage:[UIImage imageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_mButton1 setBackgroundImage:[UIImage imageFromColor:KLightGray_Color] forState:UIControlStateSelected];
        [_mButton1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mButton1;
}

-(UIButton *)mButton2{
    if (!_mButton2) {
        _mButton2 = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth / 6, 0, kScreenWidth / 6, 40)];
        _mButton2.tag = 501;
        _mButton2.selected = NO;
        [_mButton2 setImage:[UIImage imageNamed:@"Expression_1"] forState:UIControlStateNormal];
        [_mButton2 setImage:[UIImage imageNamed:@"Expression_13"] forState:UIControlStateSelected];
        [_mButton2 setBackgroundImage:[UIImage imageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [_mButton2 setBackgroundImage:[UIImage imageFromColor:KLightGray_Color] forState:UIControlStateSelected];
        [_mButton2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mButton2;
}

@end
