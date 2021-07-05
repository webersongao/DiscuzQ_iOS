//
//  DZIConButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZIConButton.h"

@interface DZIConButton ()

@property (nonatomic, strong) UILabel *nameLabel;  //!< 属性注释
@property (nonatomic, strong) UIImageView *iconView;  //!< 属性注释

@end

@implementation DZIConButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config_IConButton];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_IConButton];
    }
    return self;
}

-(void)config_IConButton{
    
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    self.userInteractionEnabled = NO;
    
}
-(void)updateTitle:(NSString *)title icon:(UIImage *)image{
    self.iconView.image = image;
    self.nameLabel.text = title;
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.height-25)/2.f, 25, 25)];
    }
    return _iconView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconView.right + 10, 0, self.width-CGRectGetMaxX(self.iconView.frame)-kMargin10, self.height)];
        _nameLabel.font = KFont(14);
        _nameLabel.textColor = KTitle_Color;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _nameLabel;
}




@end
