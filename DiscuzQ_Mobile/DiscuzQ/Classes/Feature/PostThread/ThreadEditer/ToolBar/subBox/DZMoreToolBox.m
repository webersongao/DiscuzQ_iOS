//
//  DZMoreToolBox.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMoreToolBox.h"

@interface DZMoreToolBox ()

@property (nonatomic, strong) UIButton *imgButton;
@property (nonatomic, strong) UIButton *emojiButton;
@property (nonatomic, strong) UIButton *atButton;
@property (nonatomic, strong) UIButton *topicButton;

@end

@implementation DZMoreToolBox

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_MoreToolBox];
    }
    return self;
}


-(void)config_MoreToolBox{
    
    [self.boxScroll addSubview:self.imgButton];
    [self.boxScroll addSubview:self.emojiButton];
    [self.boxScroll addSubview:self.atButton];
    [self.boxScroll addSubview:self.topicButton];
    
    self.boxScroll.contentSize = CGSizeMake(MAX(self.topicButton.right, self.width), self.height);
}



-(void)toolBoxImgPickerModeAction:(UIButton *)button{

}


-(void)toolBoxEmojiModeAction:(UIButton *)button{
    
}

-(void)toolBoxAtPersonModeAction:(UIButton *)button{
    
}

-(void)toolBoxTopicSelectModeAction:(UIButton *)button{
    
}

-(UIButton *)imgButton{
    if (!_imgButton) {
        _imgButton = [UIButton ButtonImageWithFrame:CGRectMake(kMargin10,0,self.height, self.height) normalImgPath:@"publish_picker_photo_normal_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(toolBoxImgPickerModeAction:)];
    }
    return _imgButton;
}


-(UIButton *)emojiButton{
    if (!_emojiButton) {
        _emojiButton = [UIButton ButtonImageWithFrame:CGRectMake(self.imgButton.right, 0, self.height, self.height) normalImgPath:@"publish_Emoji_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(toolBoxEmojiModeAction:)];
    }
    return _emojiButton;
}

-(UIButton *)atButton{
    if (!_atButton) {
        _atButton = [UIButton ButtonImageWithFrame:CGRectMake(self.emojiButton.right, 0, self.height, self.height) normalImgPath:@"publish_at_normal_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(toolBoxAtPersonModeAction:)];
    }
    return _atButton;
}

-(UIButton *)topicButton{
    if (!_topicButton) {
        _topicButton = [UIButton ButtonImageWithFrame:CGRectMake(self.atButton.right, 0, self.height, self.height) normalImgPath:@"publish_topic_normal_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(toolBoxTopicSelectModeAction:)];
    }
    return _topicButton;
}





@end
