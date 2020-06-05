//
//  DZNaviTabView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNaviTabView.h"

@interface DZNaviTabView ()

@property(nonatomic,strong)UIView *bottomLine;

@end

@implementation DZNaviTabView

- (instancetype)initWithTabArr:(NSArray<DZTabItem *> *)tabArray Target:(id)target action:(SEL)action
{
    self = [super initWithFrame:CGRectMake(0, 0, tabArray.count * k_NaviTab_BtnW, kToolBarHeight)];
    if (self) {
        [self config_NaviTabView];
        [self config_NaviTab:tabArray Target:target action:action];
    }
    if (tabArray.count > 3 || tabArray.count < 1) {
        return nil;
    }
    return self;
}

-(void)config_NaviTabView{
    
    [self addSubview:self.bottomLine];
    
}


-(void)config_NaviTab:(NSArray<DZTabItem *> *)tabArray Target:(id)target action:(SEL)action{
    
    UIFont *foont = self.titleFont ? self.titleFont : KBoldFont(16.0f);
    UIColor *coloor = self.titleColor ? self.titleColor : KColor(K454759_Color, 1.0);
    UIColor *highColoor = self.titleHighColor ? self.titleHighColor : KColor(K33C3A5_Color, 1.0);
    
    for (int index = 0; index < tabArray.count; index++) {
        
        DZTabItem *tabItem = tabArray[index];
        
        UIButton *titleButton = [UIButton ButtonTextWithFrame:CGRectMake((index * k_NaviTab_BtnW), 0, k_NaviTab_BtnW, self.height) titleStr:tabItem.title titleColor:coloor titleTouColor:highColoor font:foont Radius:0 Target:target action:action];
        titleButton.selected = NO;
        [self addSubview:titleButton];
        titleButton.tag = index + k_NaviTab_BtnTag;
        
        DZBaseViewController *tabCtrl = [tabItem.subCls new];
        tabCtrl.view.backgroundColor = KRandom_Color;
        tabItem.viewCtrl = tabCtrl;
    }
    
    [self updateNaviTabViewState:0];
}

-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            button.titleLabel.font = titleFont;
        }
    }
}


-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [button setTitleColor:titleColor forState:UIControlStateNormal];
        }
    }
}

-(void)setTitleHighColor:(UIColor *)titleHighColor{
    _titleHighColor = titleHighColor;
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [button setTitleColor:titleHighColor forState:UIControlStateHighlighted];
        }
    }
}

-(NSInteger)updateNaviTabViewState:(NSInteger)index{
    
    CGFloat buttonX = index * k_NaviTab_BtnW;
    NSInteger selectedTag = index + k_NaviTab_BtnTag;
    UIButton *selectedButon = [self viewWithTag:selectedTag];
    
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            button.selected = (button.tag == selectedTag) ? YES : NO;
        }
    }
    
    self.bottomLine.origin = CGPointMake((selectedButon.width-self.bottomLine.width)/2.0+buttonX, selectedButon.bottom-8);
    return index;
}



-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-8.f, 20, 3.f)];
        _bottomLine.backgroundColor = KColor(K33C3A5_Color, 1.0);
        _bottomLine.layer.cornerRadius = 1.5;
        _bottomLine.clipsToBounds = YES;
    }
    return _bottomLine;
}


@end
