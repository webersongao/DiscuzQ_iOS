//
//  DZGoodsView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZGoodsView.h"

@interface DZGoodsView ()

@property (nonatomic, strong) DZLabel *nameLabel;  //!< 属性注释
@property (nonatomic, strong) UIImageView *goodsIcon;  //!< 属性注释

@property (nonatomic, strong) UIButton *buyButton;  //!< 购买按钮
@property (nonatomic, strong) DZLabel *plateLabel;  //!< 平台

@property (nonatomic, strong) DZQDataGoods *goodModel;  //!< 购买按钮

@end

@implementation DZGoodsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_myGoodsView];
        self.backgroundColor = KLightGray_Color;
    }
    return self;
}

-(void)config_myGoodsView{
    
    [self addSubview:self.goodsIcon];
    [self addSubview:self.nameLabel];
    [self addSubview:self.buyButton];
    [self addSubview:self.plateLabel];
}

-(void)updateGoodsView:(DZQDataGoods *)dataGoods layoutH:(CGFloat)layoutHeight{
    
    self.goodModel = dataGoods;
    
    [self.goodsIcon dz_setImageWithURL:dataGoods.attributes.image_path placeholder:KImageNamed(DZQ_Square_icon)];
    self.nameLabel.text = dataGoods.attributes.title;
    self.plateLabel.text = dataGoods.attributes.type_name;
    
    [self.buyButton setTitle:checkFloat(dataGoods.attributes.price) forState:UIControlStateNormal];
    
    [self layoutGoodsSubviews];
}




-(void)layoutGoodsSubviews{
    
    self.goodsIcon.frame = CGRectMake(kMargin10, kMargin10, self.height-kMargin20, self.height-kMargin20);
    self.nameLabel.frame = CGRectMake(self.goodsIcon.right + kMargin15, kMargin10, self.width - CGRectGetMaxX(self.goodsIcon.frame) - kMargin25, kMargin50);
    self.plateLabel.frame = CGRectMake(self.nameLabel.left, self.height - kMargin25, 100, kMargin15);
    self.buyButton.frame = CGRectMake(self.width - kMargin10 - 100, self.height - kCellHeight_54, 100, kToolBarHeight);
}


-(UIImageView *)goodsIcon{
    if (!_goodsIcon) {
        _goodsIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _goodsIcon.contentMode = UIViewContentModeScaleAspectFill;
        _goodsIcon.clipsToBounds = YES;
    }
    return _goodsIcon;
}


-(DZLabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KContent_Color font:KBoldFont(KBoldTile_fontSize) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}


-(DZLabel *)plateLabel{
    if (!_plateLabel) {
        _plateLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KLightContent_Color font:KFont(KDesc_fontSize) textAlignment:NSTextAlignmentLeft];
    }
    return _plateLabel;
}

-(UIButton *)buyButton{
    if (!_buyButton) {
        _buyButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:KFont(KContent_fontSize) titleColor:KContent_Color normalImgPath:nil touchImgPath:nil isBackImage:NO picAlpha:1];
        _buyButton.layer.cornerRadius = 5.f;
        _buyButton.clipsToBounds = YES;
        _buyButton.backgroundColor = KGreen_Color;
    }
    return _buyButton;
}



@end
