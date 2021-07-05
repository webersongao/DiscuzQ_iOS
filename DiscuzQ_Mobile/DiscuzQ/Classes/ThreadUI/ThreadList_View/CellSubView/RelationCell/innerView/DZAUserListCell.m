//
//  DZAUserListCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/6/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAUserListCell.h"

@interface DZAUserListCell ()

@property (nonatomic, strong) UILabel *NameLabel;  //!< 属性注释
@property (nonatomic, strong) UIImageView *iconImage;  //!< 属性注释

@end


@implementation DZAUserListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAUserListCell];
    }
    return self;
}

-(void)layoutAUserListCell{
    [self.contentView addSubview:self.iconImage];
//    [self.contentView addSubview:self.NameLabel];
}


-(void)updateAUserListCell:(DZQDataUser *)cellModel{
    
    self.NameLabel.text = cellModel.attributes.username;
    [self.iconImage dz_setImageWithURL:cellModel.attributes.avatarUrl placeholder:kDeafultCover];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconImage.frame = self.bounds;
    self.iconImage.layer.cornerRadius = self.height/2.f;
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImage.layer.masksToBounds = YES;
    }
    return _iconImage;
}

@end
