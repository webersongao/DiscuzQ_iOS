//
//  DZArticleAttachCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZArticleAttachCell.h"

@interface DZArticleAttachCell ()

@property (nonatomic, strong) DZLabel *NameLabel;  //!< 属性注释
@property (nonatomic, strong) UIImageView *leftIcon;  //!< 属性注释

@end


@implementation DZArticleAttachCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutArtileAttachCell];
    }
    return self;
}

-(void)layoutArtileAttachCell{
    
    [self.contentView addSubview:self.leftIcon];
    [self.contentView addSubview:self.NameLabel];
}


-(void)updateAttachFileListCell:(DZQDataAttachment *)cellModel{
    
    self.NameLabel.text = cellModel.attributes.fileName;
    [self.leftIcon dz_setImageWithURL:cellModel.attributes.thumbUrl placeholder:kDeafultCover];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.leftIcon.frame = CGRectMake(0, (self.height-14.f)/2.f, 14.f, 14.f);
    self.leftIcon.layer.cornerRadius = self.height/2.f;
    self.NameLabel.frame = CGRectMake(self.leftIcon.right+kMargin10, 0, self.width-CGRectGetMaxX(self.leftIcon.frame)-kMargin20, self.height);
}

-(DZLabel *)NameLabel{
    if (!_NameLabel) {
        _NameLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KLightContent_Color fontSize:12.f];
        _NameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _NameLabel;
}

-(UIImageView *)leftIcon{
    if (!_leftIcon) {
        _leftIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _leftIcon.layer.masksToBounds = YES;
    }
    return _leftIcon;
}

@end
