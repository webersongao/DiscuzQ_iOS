//
//  DZBottomToolBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/8/12.
//

#import "DZBottomToolBar.h"

@interface DZBottomToolBar ()

@property (nonatomic, strong) UILabel *toolTextLabel;  //!< 属性注释
@property (nonatomic, strong) UILabel * centerLabel;  //!< 属性注释
@property (nonatomic, strong) UIButton * leftMainButton;  //!< 属性注释
@property (nonatomic, strong) UIButton * centerButton;  //!< 属性注释
@property (nonatomic, strong) UIButton * rightButton;  //!< 属性注释

@end

@implementation DZBottomToolBar

- (instancetype)initWithFrame:(CGRect)frame Mode:(toolBarMode)Mode
{
    self = [super initWithFrame:frame];
    if (self) {
        _mode = Mode;
        // 绿色
        self.width = KScreenWidth;
        [self layoutLibraryToolBarView];
    }
    return self;
}


-(void)layoutLibraryToolBarView{
    
    [self addSubview:self.leftMainButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.centerLabel];
    [self addSubview:self.toolTextLabel];
    
    if (self.mode == toolBar_transfer) {
        self.backgroundColor = KColor(K33C3A5_Color, 1.0);
        self.rightButton.userInteractionEnabled = NO;
        self.leftMainButton.userInteractionEnabled = NO;
        self.toolTextLabel.frame = CGRectMake(kMargin15, 0, self.width - kMargin30-kMargin15, kToolBarHeight);
        self.rightButton.frame = CGRectMake(self.width-kMargin30, 0, kMargin15, kToolBarHeight);
        [self.rightButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageRight imageTitleSpace:3.f];
        [self addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        self.leftMainButton.centerY = self.rightButton.centerY = self.toolTextLabel.centerY = kToolBarHeight/2.f;
    }else if (self.mode == toolBar_comment){
        
        [self layoutIBottomBar_CommentStyle];
        
    }else if (self.mode == toolBar_upload){
        self.rightButton.hidden = YES;
        self.leftMainButton.frame = self.bounds;
        self.leftMainButton.titleLabel.font = KBoldFont(16.f);
        self.backgroundColor = KColor(K33C3A5_Color, 1.0);
        [self.rightButton setImage:nil forState:UIControlStateNormal];
        [self.rightButton setImage:nil forState:UIControlStateNormal];
        [self.leftMainButton setTitle:@"确定上传" forState:UIControlStateNormal];
        self.leftMainButton.centerY = self.rightButton.centerY = kToolBarHeight/2.f;
        [self.leftMainButton setTitleColor:KColor(KFFFFFF_Color, 1.0) forState:UIControlStateNormal];
    }else if (self.mode == toolBar_naviAction){
        [self layoutIBottomToolBar_naviStyle];
    }
}

// 更新左侧按钮文字
-(void)updateNaviLeftTitle:(NSString *)leftTitle{
    if (leftTitle.length) {
        [self.leftMainButton setTitle:leftTitle forState:UIControlStateNormal];
        [self.leftMainButton setTitle:leftTitle forState:UIControlStateHighlighted];
    }
}

// 更新选中数量
-(void)updateNaviEditBar:(NSInteger)selectedNo{
    self.centerLabel.hidden = selectedNo ? NO : YES;
    self.centerLabel.text = [NSString stringWithFormat:@"已勾选%ld个文件",selectedNo];
}

-(void)showBottomToolBar:(BOOL)bShow{
    CGFloat toolbarTopY = -self.height;
    if (bShow) {
        toolbarTopY = (self.mode == toolBar_naviAction) ? (KNavi_ContainStatusBar_Height - self.height) : (KScreenHeight-KBottom_Height_X);
    }else{
        self.rightButton.selected = NO;
        toolbarTopY = (self.mode == toolBar_naviAction) ? -self.height : KScreenHeight;
    }
    if (self.top != toolbarTopY) {
        [UIView animateWithDuration:0.3 animations:^{
            [self setTop:toolbarTopY];
        }];
    }
}

- (void)setRightSelected:(BOOL)rightSelected{
    _rightSelected = rightSelected;
    self.rightButton.selected = rightSelected;
}

/**
 底部提示条
 @param alertString 提示文字
 */
-(void)updateTransferAlert:(NSString *)alertString button:(int)buttonTag{
    if (!alertString.length) {
        return;
    }
    self.tag = buttonTag;
    self.toolTextLabel.text = alertString;
    self.toolTextLabel.hidden = alertString.length ? NO : YES;
}

-(void)leftButtonAction:(UIButton *)button{
    if (self.leftMainBlock) {
        self.leftMainBlock(button);
    }
}

-(void)rightButtonAction:(UIButton *)button{
    button.selected = !button.isSelected;
    if (self.rightBlock) {
        self.rightBlock(button);
    }
}

-(void)centerButtonAction:(UIButton *)button{
    button.selected = !button.isSelected;
    if (self.centerBlock) {
        self.centerBlock(button);
    }
}


-(void)layoutIBottomToolBar_naviStyle{
    
    self.toolTextLabel.font = KBoldFont(18.f);
    self.backgroundColor = KWhite_Color;
    [self.toolTextLabel setTextColor:KColor(K31323E_Color, 1.0)];
    [self.leftMainButton setTitleColor:KColor(K33C3A5_Color, 1.0) forState:UIControlStateNormal];
    [self.leftMainButton setTitleColor:KColor(K33C3A5_Color, 1.0) forState:UIControlStateHighlighted];
    [self.rightButton setTitleColor:KColor(K33C3A5_Color, 1.0) forState:UIControlStateNormal];
    [self.rightButton setTitleColor:KColor(K33C3A5_Color, 1.0) forState:UIControlStateSelected];
    [self.rightButton setTitleColor:KColor(K33C3A5_Color, 1.0) forState:UIControlStateHighlighted];
    
    [self.rightButton setImage:nil forState:UIControlStateNormal];
    [self.rightButton setImage:nil forState:UIControlStateNormal];
    //        [self.leftMainButton setImage:ImageNamed(@"share_icon_back") forState:UIControlStateNormal];
    //        [self.leftMainButton setImage:ImageNamed(@"share_icon_back") forState:UIControlStateHighlighted];
    
    [self.rightButton setTitle:@"全选" forState:UIControlStateNormal];
    [self.rightButton setTitle:@"取消全选" forState:UIControlStateSelected];
    
    [self.leftMainButton setImage:nil forState:UIControlStateNormal];
    [self.leftMainButton setImage:nil forState:UIControlStateNormal];
    [self.leftMainButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.leftMainButton setTitle:@"取消" forState:UIControlStateHighlighted];
    
    self.toolTextLabel.textAlignment = NSTextAlignmentCenter;
    self.leftMainButton.frame = CGRectMake(kMargin15, 0, 80, kToolBarHeight);
    self.toolTextLabel.frame = CGRectMake(95.f, 0, self.width - 190.f, kToolBarHeight);
    self.leftMainButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.rightButton.frame = CGRectMake(self.width - kMargin15 - 80, 0, 80, kToolBarHeight);
    
}

-(void)layoutIBottomBar_CommentStyle{
    
    
    self.backgroundColor = KWhite_Color;
    [self.leftMainButton setTitleColor:KColor(K31323E_Color, 1.0) forState:UIControlStateNormal];
    [self.leftMainButton setTitleColor:KColor(K31323E_Color, 1.0) forState:UIControlStateHighlighted];
    
    [self.rightButton setTitleColor:KColor(K31323E_Color, 1.0) forState:UIControlStateNormal];
    [self.rightButton setTitleColor:KHight_Color forState:UIControlStateSelected];
    [self.rightButton setTitleColor:KColor(K31323E_Color, 1.0) forState:UIControlStateHighlighted];
    
    [self.leftMainButton setImage:KImageNamed(@"dz_list_comment") forState:UIControlStateNormal];
    [self.leftMainButton setImage:KImageNamed(@"dz_list_comment") forState:UIControlStateHighlighted];
    
    [self.rightButton setImage:KImageNamed(@"dz_list_praise_n") forState:UIControlStateNormal];
    [self.rightButton setImage:KImageNamed(@"dz_list_praise_f") forState:UIControlStateSelected];
    [self.rightButton setImage:KImageNamed(@"dz_list_praise_n") forState:UIControlStateHighlighted];
    [self.rightButton setTitle:@"点赞" forState:UIControlStateNormal];
    [self.rightButton setTitle:@"已赞" forState:UIControlStateSelected];
    [self.rightButton setTitle:@"点赞" forState:UIControlStateHighlighted];
    [self.leftMainButton setTitle:@"评论" forState:UIControlStateNormal];
    [self.leftMainButton setTitle:@"评论" forState:UIControlStateHighlighted];
    self.leftMainButton.centerY = self.rightButton.centerY = kToolBarHeight/2.f;
    [self.leftMainButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5.f];
    [self.rightButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsImageLeft imageTitleSpace:5.f];
    
    self.leftMainButton.frame = CGRectMake(0, 0, self.width/2.f, kToolBarHeight);
    self.leftMainButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.rightButton.frame = CGRectMake(self.width/2.f, 0, self.width/2.f, kToolBarHeight);
    
    
    // 阴影
    self.layer.shadowRadius = 7.5;
    self.layer.shadowOpacity = 0.14;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowColor = KColor(@"2C333E", 1.0).CGColor;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(self.width/2.f, 0, 0.5, kToolBarHeight)];
    line.backgroundColor = KColor(KECECEC_Color, 1.0);
    [self addSubview:line];
}



-(UILabel *)toolTextLabel{
    if (_toolTextLabel == nil) {
        
        _toolTextLabel = [UILabel labelWithFrame:CGRectMake(kMargin15, 0, self.width - 120 - kMargin15, kToolBarHeight) title:@"" titleColor:KColor(K31323E_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentLeft];
    }
    return _toolTextLabel;
}

-(UILabel *)centerLabel{
    if (_centerLabel == nil) {
        _centerLabel = [UILabel labelWithFrame:CGRectMake(100, 0, self.width - 200, kToolBarHeight) title:@"" titleColor:KColor(K31323E_Color, 1.0) font:KFont(14) textAlignment:NSTextAlignmentCenter];
    }
    return _centerLabel;
}


-(UIButton *)leftMainButton{
    if (!_leftMainButton) {
        _leftMainButton = [UIButton ButtonTextWithFrame:CGRectMake(0, 0, 100, kToolBarHeight) titleStr:@"" titleColor:KColor(K31323E_Color, 1.0) titleTouColor:KColor(K31323E_Color, 1.0) font:KFont(16.f) Radius:0 Target:self action:@selector(leftButtonAction:)];
    }
    return _leftMainButton;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton ButtonNormalWithFrame:CGRectMake(0, 0, 100, kToolBarHeight) title:nil titleFont:KFont(16.f) titleColor:KColor(KFFFFFF_Color, 1.0) normalImgPath:DZQ_icon touchImgPath:DZQ_icon isBackImage:NO picAlpha:1];
        [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

-(UIButton *)centerButton{
    if (!_centerButton) {
        _centerButton = [UIButton ButtonNormalWithFrame:CGRectMake(0, 0, 100, kToolBarHeight) title:nil titleFont:KFont(16.f) titleColor:KColor(KFFFFFF_Color, 1.0) normalImgPath:DZQ_icon touchImgPath:DZQ_icon isBackImage:NO picAlpha:1];
        [_centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}


@end
