//
//  DZQChatBaseCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatBaseCell.h"

@interface DZQChatMsgLayout ()

//@property(nonatomic, strong) DZQChatMsgLayout *layout;

@end

@implementation DZQChatBaseCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        // Remove touch delay for iOS 7
        for (UIView *view in self.subviews) {
            if([view isKindOfClass:[UIScrollView class]]) {
                ((UIScrollView *)view).delaysContentTouches = NO;
                break;
            }
        }
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KLightGray_Color;
        self.contentView.backgroundColor = KLightGray_Color;
        [self config_ChatCellUserInterface];
    }
    return self;
}


-(void)config_ChatCellUserInterface{
    
    // 2、创建头像
    _mHeaderImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _mHeaderImgBtn.backgroundColor =  [UIColor brownColor];
    _mHeaderImgBtn.tag = 10;
    _mHeaderImgBtn.userInteractionEnabled = YES;
    [self.contentView addSubview:_mHeaderImgBtn];
    _mHeaderImgBtn.clipsToBounds = YES;
    [_mHeaderImgBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //创建时间
    _mMessageTimeLab = [UILabel new];
    _mMessageTimeLab.bounds = CGRectMake(0, 0, DZQChatTimeWidth, DZQChatTimeHeight);
    _mMessageTimeLab.top = DZQChatTimeTop;
    _mMessageTimeLab.centerX = kScreenWidth*0.5;
    [self.contentView addSubview:_mMessageTimeLab];
    _mMessageTimeLab.textAlignment = NSTextAlignmentCenter;
    _mMessageTimeLab.font = [UIFont systemFontOfSize:DZQChatTimeFont];
    _mMessageTimeLab.textColor = [UIColor whiteColor];
    _mMessageTimeLab.backgroundColor = makeColorRgb(220, 220, 220);
    _mMessageTimeLab.clipsToBounds = YES;
    _mMessageTimeLab.layer.cornerRadius = 3;
    
    //背景按钮
    _mBackImgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mBackImgButton.backgroundColor =  [KLightGray_Color colorWithAlphaComponent:0.4];
    _mBackImgButton.tag = 50;
    [self.contentView addSubview:_mBackImgButton];
    [_mBackImgButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}


-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)updateChatCell:(DZQChatMsgLayout *)layout indexPath:(NSIndexPath *)indexPath delegate:(id)delegate{
    _layout = layout;
    _indexPath = indexPath;
    _cellDelegate = delegate;
    
    _mMessageTimeLab.hidden = !layout.message.showTime;
    _mMessageTimeLab.text = layout.message.messageTime;
    _mMessageTimeLab.frame = layout.timeLabRect;
    
    self.mHeaderImgBtn.frame = layout.headerImgRect;
    [self.mHeaderImgBtn setBackgroundImage:KImageNamed(DZQ_icon) forState:UIControlStateNormal];
    self.mHeaderImgBtn.layer.cornerRadius = self.mHeaderImgBtn.height*0.5;
    if(_layout.message.messageFrom == DZQChatMsgFromOther){
        [self.mHeaderImgBtn setBackgroundImage:KImageNamed(DZQ_icon) forState:UIControlStateNormal];
    }
}


//消息按钮
-(void)buttonPressed:(UIButton *)sender{
    
    
}




// 初始化
-(UITextView *)labelTextView{
    if (!_labelTextView) {
        _labelTextView = [UITextView new];
        _labelTextView.editable = NO;
        _labelTextView.scrollEnabled = NO;
        _labelTextView.backgroundColor = [UIColor clearColor];
        _labelTextView.textContainer.lineFragmentPadding = 0;
        _labelTextView.layoutManager.allowsNonContiguousLayout = NO;
        _labelTextView.dataDetectorTypes = UIDataDetectorTypeAll;
        _labelTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _labelTextView;
}

@end
