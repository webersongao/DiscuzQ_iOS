//
//  HomeCollectionCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "HomeCollectionCell.h"
#import "MediaHeader.h"

@interface HomeCollectionCell ()

@property (nonatomic, strong) UILabel *NameLabel;  //!< 属性注释
@property (nonatomic, strong) UIImageView *iconImage;  //!< 属性注释

@end


@implementation HomeCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutHomeCollectionCell];
    }
    return self;
}


-(void)layoutHomeCollectionCell{
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.NameLabel];
}


-(void)updateForumCellWithModel:(DZThreadCateM *)cellModel{
    _cellModel = cellModel;
    self.NameLabel.text = cellModel.name;
    [self.iconImage dz_setImageWithURL:cellModel.icon placeholder:kDeafultCover];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake((kCellWidth - kHeaderIconHeight)/2.f, 0, kHeaderIconHeight, kHeaderIconHeight)];
        _iconImage.layer.cornerRadius = 8.f;
        _iconImage.layer.masksToBounds = YES;
    }
    return _iconImage;
}

-(UILabel *)NameLabel{
    if (!_NameLabel) {
        _NameLabel = [UILabel labelWithFrame:CGRectMake(0, kCellHeight-14.f, kCellWidth, 14.f) title:@"" titleColor:KBlack_Color fontSize:13.f];
    }
    return _NameLabel;
}




@end
