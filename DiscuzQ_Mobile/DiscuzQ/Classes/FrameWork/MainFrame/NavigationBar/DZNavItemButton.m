//
//  DZNavItemButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZNavItemButton.h"

@interface DZNavItemButton ()

@property (nonatomic, strong) UIButton *innerButton;  //!< 属性注释

@property (nonatomic, strong) DZBarButtonItem *buttonItem;  //!< 属性注释

@end

@implementation DZNavItemButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.innerButton];
    }
    return self;
}

-(void)updateInnerButton:(DZBarButtonItem *)buttonItem{
    
    if (!buttonItem) {
        return;
    }
    self.hidden = buttonItem ? NO : YES;
    if (buttonItem.isTextButton) {
        [self.innerButton setTitle:buttonItem.title forState:UIControlStateNormal];
        [self.innerButton setTitle:buttonItem.title_H forState:UIControlStateSelected];
        [self.innerButton setTitle:buttonItem.title_H forState:UIControlStateHighlighted];
    }else{
        if (buttonItem.isBackImage) {
            [self.innerButton setBackgroundImage:[UIImage imageNamed:buttonItem.imagePath] forState:UIControlStateNormal];
            [self.innerButton setBackgroundImage:[UIImage imageNamed:buttonItem.imagePath_H] forState:UIControlStateSelected];
            [self.innerButton setBackgroundImage:[UIImage imageNamed:buttonItem.imagePath_H] forState:UIControlStateHighlighted];
        }else{
            [self.innerButton setImage:[UIImage imageNamed:buttonItem.imagePath] forState:UIControlStateNormal];
            [self.innerButton setImage:[UIImage imageNamed:buttonItem.imagePath_H] forState:UIControlStateSelected];
            [self.innerButton setImage:[UIImage imageNamed:buttonItem.imagePath_H] forState:UIControlStateHighlighted];
        }
        self.innerButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    [self.innerButton sizeToFit];
    [self addTarget:buttonItem.target action:buttonItem.action forControlEvents:UIControlEventTouchUpInside];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.innerButton.center = CGPointMake(self.width/2.0, self.height/2.0);
}


-(UIButton *)innerButton{
    if (!_innerButton) {
        _innerButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _innerButton.titleLabel.font = KFont(16);
        _innerButton.userInteractionEnabled = NO;
        [_innerButton setTitleColor:KContent_Color forState:UIControlStateNormal];
        [_innerButton setTitleColor:KTitle_Color forState:UIControlStateSelected];
        [_innerButton setTitleColor:KTitle_Color forState:UIControlStateHighlighted];
    }
    return _innerButton;
}

@end
