//
//  DZSettingSectionHeader.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSettingSectionHeader.h"

@interface DZSettingSectionHeader ()

@property (nonatomic, strong) UILabel *titleLabel;  //!< <#属性注释#>

@end

@implementation DZSettingSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        self.contentView.backgroundColor = KLightGray_Color;
    }
    return self;
}

-(void)updateLabelTitle:(NSString *)title{
    self.titleLabel.text = title;
}


-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectMake(kMargin20, 0, 200, kToolBarHeight) title:@"" titleColor:KGray_Color fontSize:14 textAlignment:NSTextAlignmentLeft];
    }
    return _titleLabel;
}



@end
