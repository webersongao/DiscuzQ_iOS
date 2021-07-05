//
//  DZNavigationBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import "DZNavigationBar.h"
#import "YYFPSLabel.h"
#import "UILabel+Common.h"
#import "UIButton+Common.h"
//#import "UIButton+ImageTitleSpacing.h"

@interface DZNavigationBar ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *naviLogo;  //!< 属性注释
@property (nonatomic, strong) YYFPSLabel *FPSLabel;  //!< 属性注释
@property (nonatomic, strong) UIView *bottomLine;  //!< 属性注释
@property (nonatomic, strong) DZNavItemButton *leftButton;
@property (nonatomic, strong) DZNavItemButton *leftButton2;
@property (nonatomic, strong) DZNavItemButton *rightButton;
@property (nonatomic, strong) DZNavItemButton *rightButton2;

@end

@implementation DZNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_NavigationBar];
        [self addSubview:self.naviLogo];
        [self addSubview:self.titleLabel];
        [self addSubview:self.bottomLine];
        [self addSubview:self.leftButton];
        [self addSubview:self.leftButton2];
        [self addSubview:self.rightButton];
        [self addSubview:self.rightButton2];
    }
    return self;
}

-(void)config_NavigationBar{
    
    //导航条的渲染颜色
    [self setBarTintColor:KLightLine_Color];
    //设置 bar 的标题字体颜色
    self.titleTextAttributes = @{NSForegroundColorAttributeName : KTitle_Color, NSFontAttributeName : KExtraBoldFont(17.0f)};
}

-(void)setBarTintColor:(UIColor *)barTintColor{
    _barTintColor = barTintColor;
    self.backgroundColor = barTintColor;
}

-(void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes{
    _titleTextAttributes = titleTextAttributes;
    if (!self.titleString.length) {
        return;
    }
    self.titleLabel.attributedText = [NSString addAttributeWithString:self.titleString attributes:titleTextAttributes];
}

-(void)updateNaviLogo:(UIImage *)naviLogo path:(NSString *)urlPath{
    if (naviLogo) {
        _titleLabel.hidden = YES;
        _titleView.hidden = YES;
    }
    _naviLogo.hidden = NO;
    [_naviLogo dz_setImageWithURL:urlPath placeholder:naviLogo];
}

-(void)setTitleView:(UIView *)titleView{
    if (titleView) {
        _titleLabel.hidden = YES;
        _naviLogo.hidden = YES;
    }
    _titleView.hidden = NO;
    _titleView = titleView;
    _titleView.left = self.leftButton.right + kMargin15;
    [self addSubview:_titleView];
    [self bringSubviewToFront:_titleView];
}

-(void)setTitleString:(NSString *)titleString{
    if (titleString.length) {
        _naviLogo.hidden = YES;
        _titleView.hidden = YES;
    }
    _titleLabel.hidden = NO;
    _titleString = titleString;
    [self updateNaviTitleLabel:self.titleString attribute:self.titleTextAttributes];
}


-(UIButton *)updateNaviOneItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft{
    [self updateNaviItems:@[item] Layout:isLeft];
    return isLeft ? self.leftButton.innerButton : self.rightButton.innerButton;
}

-(UIButton *)updateNaviThirdItem:(DZBarButtonItem *)item Layout:(BOOL)isLeft{
    if (!item) {
        return nil;
    }
    if (isLeft) {
        [self.leftButton2 updateInnerButton:item];
    }else{
        [self.rightButton2 updateInnerButton:item];
    }
    return isLeft ? self.leftButton2.innerButton : self.rightButton2.innerButton;
}

-(void)updateNaviItems:(NSArray<DZBarButtonItem *> *)items Layout:(BOOL)isLeft{
    
    if (isLeft) {
        [self.leftButton updateInnerButton:items.firstObject];
        if (items.count > 1) {
            [self.leftButton2 updateInnerButton:items[1]];
        }
    }else{
        [self.rightButton updateInnerButton:items.firstObject];
        if (items.count > 1) {
            [self.rightButton2 updateInnerButton:items[1]];
        }
    }
}

-(void)updateNaviTitleLabel:(NSString *)titleString attribute:(NSDictionary *)attributeDict{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    paraStyle.alignment = NSTextAlignmentCenter;
    //    paraStyle.lineSpacing = lineSpacing;//行距
    
    NSMutableDictionary *muAttributeDict = [NSMutableDictionary dictionaryWithDictionary:attributeDict];
    if (![attributeDict valueForKey:NSParagraphStyleAttributeName]) {
        [muAttributeDict addEntriesFromDictionary:@{NSParagraphStyleAttributeName:paraStyle}];
    }
    
    NSDictionary *innerDict = muAttributeDict ? muAttributeDict : @{NSParagraphStyleAttributeName:paraStyle,NSForegroundColorAttributeName : KTitle_Color, NSFontAttributeName : KExtraBoldFont(17.0f)};
    self.titleLabel.attributedText = [NSString addAttributeWithString:titleString attributes:innerDict];
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectMake(100, KStatusBarHeight, self.width -200, KNavigation_Bar_Height) title:@"" titleColor:KTitle_Color font:KBoldFont(17) textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

-(UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-0.5, self.width, 0.5)];
        _bottomLine.hidden = YES;
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}

-(UIImageView *)naviLogo{
    if (!_naviLogo) {
        _naviLogo = [[UIImageView alloc] initWithFrame:CGRectMake(100, self.height-39.f, self.width-200, 34.f)];
        _naviLogo.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _naviLogo;
}

-(YYFPSLabel *)FPSLabel{
    if (!_FPSLabel) {
        _FPSLabel = [[YYFPSLabel alloc] initWithFrame:CGRectMake(self.width-120, self.height-20, 50, 20)];
    }
    return _FPSLabel;
}

-(DZNavItemButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[DZNavItemButton alloc] initWithFrame:CGRectMake(kMargin15, KStatusBarHeight + ((KNavigation_Bar_Height - 44)/2.0), 44, 44)];
    }
    return _leftButton;
}

-(DZNavItemButton *)leftButton2{
    if (!_leftButton2) {
        _leftButton2 =  [[DZNavItemButton alloc] initWithFrame:CGRectMake(self.leftButton.right + kMargin15, self.leftButton.top, 44, 44)];
    }
    return _leftButton2;
}

-(DZNavItemButton *)rightButton{
    if (!_rightButton) {
        _rightButton =  [[DZNavItemButton alloc] initWithFrame:CGRectMake(self.width - 44 - kMargin15, self.leftButton.top, 44, 44)];
    }
    return _rightButton;
}

-(DZNavItemButton *)rightButton2{
    if (!_rightButton2) {
        _rightButton2 =  [[DZNavItemButton alloc] initWithFrame:CGRectMake(self.rightButton.left - kMargin15 - 44, self.leftButton.top, 44, 44)];
    }
    return _rightButton2;
}

@end




