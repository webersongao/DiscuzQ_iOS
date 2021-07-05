//
//  DZTermsLabel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/3/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZTermsLabel.h"
#import "DZCheckBox.h"

@interface DZTermsLabel()<DZCheckBoxDelegate>

@property (nonatomic, strong) DZCheckBox * checkBox;  //!< 属性注释
@property (nonatomic, strong) UIButton * termbuton;  //!< 属性注释

@end

@implementation DZTermsLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_localTermsLabel];
    }
    return self;
}

- (void)config_localTermsLabel {
    
    [self addSubview:self.checkBox];
    [self addSubview:self.termbuton];
}

- (void)readTerms {
    if (self.readTermBlock) {
        self.readTermBlock();
    }
}

- (void)didSelectedCheckBox:(DZCheckBox *)checkbox checked:(BOOL)checked {
    self.isAgree = checked;
}



- (UIButton *)termbuton{
    if (!_termbuton) {
        _termbuton = [[UIButton alloc] initWithFrame:CGRectMake(self.checkBox.right + kMargin5, 0, self.width-self.checkBox.width,self.height)];
        _termbuton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_termbuton setTitleColor:KGreen_Color forState:UIControlStateNormal];
        _termbuton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_termbuton setTitle:checkTwoStr(DZ_APP_Name, @" 服务条款") forState:UIControlStateNormal];
        [_termbuton addTarget:self action:@selector(readTerms) forControlEvents:UIControlEventTouchUpInside];
    }
    return _termbuton;
}

-(DZCheckBox *)checkBox{
    if (!_checkBox) {
        _checkBox = [[DZCheckBox alloc] initWithTitle:@"我同意:" delegate:self];
        CGFloat textWidth = [_checkBox.titleLabel.text widthForFont:KFont(14)];
        _checkBox.frame = CGRectMake(0, 0, textWidth + 20, self.height);
        _checkBox.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_checkBox setTitleColor:KBlack_Color forState:UIControlStateNormal];
        [_checkBox setImage:[UIImage imageNamed:@"dz_icon_check"] forState:UIControlStateNormal];
        [_checkBox setImage:[UIImage imageNamed:@"check_select"] forState:UIControlStateSelected];
        [_checkBox setChecked:YES];
    }
    return _checkBox;
}



@end
