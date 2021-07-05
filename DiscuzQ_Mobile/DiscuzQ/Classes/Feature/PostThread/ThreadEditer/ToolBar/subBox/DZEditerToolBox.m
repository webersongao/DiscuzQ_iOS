//
//  DZEditerToolBox.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZEditerToolBox.h"


@interface DZEditerToolBox ()

@property (nonatomic, strong) UIButton *boldButton;  // 加错
@property (nonatomic, strong) UIButton *italicButton; // 斜体
@property (nonatomic, strong) UIButton *linkButton;  // 加链接

@end

@implementation DZEditerToolBox

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_EditerToolBox];
    }
    return self;
}


-(void)config_EditerToolBox{
    
    [self.boxScroll addSubview:self.boldButton];
    [self.boxScroll addSubview:self.italicButton];
    [self.boxScroll addSubview:self.linkButton];
    
    self.boxScroll.contentSize = CGSizeMake(MAX(self.linkButton.right, self.width), self.height);
}

-(void)editerBoxTextModeAction:(UIButton *)button{
    
    
}



-(UIButton *)boldButton{
    if (!_boldButton) {
        _boldButton = [UIButton ButtonImageWithFrame:CGRectMake(kMargin10,0,self.height, self.height) normalImgPath:@"publish_keyboard_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(editerBoxTextModeAction:)];
    }
    return _boldButton;
}

-(UIButton *)italicButton{
    if (!_italicButton) {
        _italicButton = [UIButton ButtonImageWithFrame:CGRectMake(self.boldButton.right,0,self.height, self.height) normalImgPath:@"publish_keyboard_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(editerBoxTextModeAction:)];
    }
    return _italicButton;
}


-(UIButton *)linkButton{
    if (!_linkButton) {
        _linkButton = [UIButton ButtonImageWithFrame:CGRectMake(self.italicButton.right,0,self.height, self.height) normalImgPath:@"publish_keyboard_icon" touchImgPath:@"publish_keyboard_icon" isBackImage:NO Target:self action:@selector(editerBoxTextModeAction:)];
    }
    return _linkButton;
}














@end
