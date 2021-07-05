//
//  DZSiteListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSiteListCell.h"

@interface DZSiteListCell ()

@property (nonatomic, strong) UILabel *NameLabel;  //!< 属性注释
@property (nonatomic, strong) UILabel *subNameLabel;  //!< 属性注释
@property (nonatomic, strong) UILabel *urlStringLabel;  //!< 属性注释
@property (nonatomic, strong) UILabel *siteStateLabel;  //!< 属性注释

@property (nonatomic, strong) UIImageView *iconImage;  //!< 属性注释

@end


@implementation DZSiteListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutSiteListCellCell];
    }
    return self;
}


-(void)layoutSiteListCellCell{
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.NameLabel];
    [self.contentView addSubview:self.subNameLabel];
    [self.contentView addSubview:self.urlStringLabel];
    [self.contentView addSubview:self.siteStateLabel];
}


-(void)updateSiteCellWithModel:(DZSiteItem *)siteItem{

    self.NameLabel.text = siteItem.siteName;
    self.subNameLabel.text = siteItem.siteDescription;
    self.urlStringLabel.text = siteItem.siteUrlString;
    BOOL isCurrent = [[DZSiteHelper shared].siteUrlString isEqualToString:siteItem.siteUrlString];
    self.siteStateLabel.text = KSelect(isCurrent, @"当前站点", @"");
    [self.iconImage dz_setImageWithURL:siteItem.siteIcon placeholder:kDeafultCover];
    
    
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(kMargin10, (kCellHeight_60 - 30)/2.f, 30, 30)];
        _iconImage.layer.cornerRadius = 15.f;
        _iconImage.layer.masksToBounds = YES;
    }
    return _iconImage;
}

-(UILabel *)NameLabel{
    if (!_NameLabel) {
        _NameLabel = [UILabel labelWithFrame:CGRectMake(self.iconImage.right + kMargin10, 14.f, kScreenWidth/2.0-(CGRectGetMaxX(self.iconImage.frame)+kMargin20), 15.f) title:@"" titleColor:KTitle_Color fontSize:14.f];
        _NameLabel.font = KBoldFont(14.0);
        _NameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _NameLabel;
}

-(UILabel *)subNameLabel{
    if (!_subNameLabel) {
        _subNameLabel = [UILabel labelWithFrame:CGRectMake(self.NameLabel.left, self.NameLabel.bottom + kMargin10, kScreenWidth - CGRectGetMaxX(self.iconImage.frame)- 100, 13.f) title:@"" titleColor:KLightContent_Color fontSize:12.f];
        _subNameLabel.textAlignment = NSTextAlignmentLeft;
        _subNameLabel.numberOfLines = 2;
    }
    return _subNameLabel;
}

-(UILabel *)urlStringLabel{
    if (!_urlStringLabel) {
        _urlStringLabel = [UILabel labelWithFrame:CGRectMake(self.NameLabel.right, self.NameLabel.top, kScreenWidth/2.0, 15.f) title:@"" titleColor:KGray_Color fontSize:14.f];
        _urlStringLabel.textAlignment = NSTextAlignmentRight;
    }
    return _urlStringLabel;
}


-(UILabel *)siteStateLabel{
    if (!_siteStateLabel) {
        _siteStateLabel = [UILabel labelWithFrame:CGRectMake(kScreenWidth - 90, self.subNameLabel.top, 80, 13.f) title:@"" titleColor:KGreen_Color font:KBoldFont(12) textAlignment:NSTextAlignmentRight];
    }
    return _siteStateLabel;
}




@end
