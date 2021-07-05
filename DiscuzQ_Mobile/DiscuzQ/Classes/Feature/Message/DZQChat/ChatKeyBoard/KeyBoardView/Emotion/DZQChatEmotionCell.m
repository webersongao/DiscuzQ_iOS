//
//  DZQChatEmotionCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatEmotionCell.h"
#import "DZQChatKeyHeader.h"

@interface DZQChatEmotionCell ()

@property (nonatomic,strong)NSString *string;
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)UIButton *button;

@end

//表情视图的表单cell
@implementation DZQChatEmotionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = KLightGray_Color;
        self.contentView.frame = self.bounds;
        
        self.button = [[UIButton alloc] init];
        self.button.userInteractionEnabled = false;
        [self.contentView addSubview:self.button];
        _button.frame = self.contentView.bounds;
    }
    return self;
}

-(void)updateEmotionCell:(id)innerObj{
    if ([innerObj isKindOfClass:[UIImage class]]) {
        [self config_EmotionImage:innerObj];
    }else if ([innerObj isKindOfClass:[NSString class]]){
        [self config_EmotionString:innerObj];
    }
}

- (void)config_EmotionString:(NSString *)string{
    if ([string isEqual: DeleteButtonId]) {
        [self.button setTitle:nil forState:UIControlStateNormal];
        [self.button setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
        [self.button setImage:[UIImage imageNamed:@"DeleteEmoticonBtnHL"] forState:UIControlStateHighlighted];
    } else {
        [self.button setImage:nil forState:UIControlStateNormal];
        [self.button setImage:nil forState:UIControlStateHighlighted];
        [self.button setTitle:string forState:UIControlStateNormal];
    }
}

- (void)config_EmotionImage:(UIImage *)image{
    [self.button setTitle:nil forState:UIControlStateNormal];
    if (image) {
        [self.button setImage:image forState:UIControlStateNormal];
        [self.button setImage:image forState:UIControlStateHighlighted];
    } else {
        [self.button setImage:nil forState:UIControlStateNormal];
        [self.button setImage:nil forState:UIControlStateHighlighted];
    }
}

@end
