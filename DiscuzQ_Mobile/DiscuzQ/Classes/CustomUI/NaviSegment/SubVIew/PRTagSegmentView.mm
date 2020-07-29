//
//  PRTagSegmentView.m
//  DiscuzQ
//
//  Created by third on 14-4-21.
//
//

#import "PRTagSegmentView.h"
#import "PRTriangleCaptionBtn.h"

//默认颜色
#define BG_COLOR [UIColor colorWithRed:0xEC/255.0f green:0xE2/255.0f blue:0xD9/255.0f alpha:1]
#define SELECT_LINE_COLOR [UIColor colorWithRed:0x94/255.0f green:0x6B/255.0f blue:0x4F/255.0f alpha:1]
@interface PRTagSegmentView ()
{
    NSInteger m_updateSelect;
}
@property (nonatomic, strong) UIView *lineView;
@end

@implementation PRTagSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame screenType:kSegNormal];
}

- (instancetype)initWithFrame:(CGRect)frame screenType:(SegTabType)screenType
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _screenType = screenType;
        
        _bgColor = BG_COLOR;
        _selectLineColor = SELECT_LINE_COLOR;
        _titleColor = [UIColor darkTextColor];
        _titleHightColor = [UIColor orangeColor];
        _btnArr = [[NSMutableArray alloc] init];
        _titleFont = [UIFont systemFontOfSize:16];
        _titleSelectFont = [UIFont systemFontOfSize:16];
        _titleRcctArr = [[NSMutableArray alloc] init];
        _titleArr = [[NSMutableArray alloc] init];
        
        UIView *bottomLineView = [[UIView alloc] init];
        [self addSubview:bottomLineView];
        _bottomLineView = bottomLineView;
        bottomLineView.backgroundColor = KColor(@"#E2E2E5", 1.0);
        bottomLineView.hidden = YES;
        
        self.backgroundColor = _bgColor;
        [self addSubview:self.lineView];
    }
    
    return self;
}

- (void)setupAllItems:(BOOL)bReload {
    
    if (!self.titleArr.count) {
        return;
    }
    
    if (bReload && self.btnArr.count) {
        for (UIView *subBtnview in self.btnArr) {
            [subBtnview removeFromSuperview];
        }
        [self.btnArr removeAllObjects];
    }
    
    if (self.selectIndex >= self.titleArr.count || self.selectIndex < 0) {
        _selectIndex = 0;
    }
    
    [self configSegmentButtonsView];
    
    [self reLayoutAllButtonSubviews];
    
}

-(void)configSegmentButtonsView{
    
    for (NSInteger i = 0; i < self.titleArr.count; i++)
    {
        PRTriangleCaptionBtn* btnView = [PRNaviTabManager configSegmentButton:self.titleArr[i]];
        btnView.tag = i;
        if (self.selectIndex == i) {
            [btnView setCaptionBtnTitleColor:self.titleHightColor forSelectState:YES];
            [btnView setCaptionTitleTopFont:self.titleSelectFont];
        }else {
            [btnView setCaptionBtnTitleColor:self.titleColor forSelectState:NO];
            [btnView setCaptionTitleTopFont:self.titleFont];
        }
        
        [btnView setCaptionTitleColor:self.titleHightColor forState:UIControlStateHighlighted];
        [btnView addCaptionTitleTarget:self action:@selector(touchTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnView];
        [self.btnArr addObject:btnView];
    }
}

- (void)reLayoutAllButtonSubviews{
    
    [self layoutBottomLineView];
    
    for (int index = 0; index<self.btnArr.count; index ++) {
        PRTriangleCaptionBtn* btnView = self.btnArr[index];
        CGRect btnRect = [self.titleRcctArr[index] CGRectValue];
        btnView.frame = btnRect;
        [btnView updateCaptionState:(self.selectIndex == index)];
    }
}


-(void)layoutBottomLineView{
    
    CGRect lineRect = [self.titleRcctArr[self.selectIndex] CGRectValue];
    lineRect.origin.y += lineRect.size.height - 2 - 12;
    lineRect.size.height = 2;
    
    CGRect lineFrame = lineRect;
    if (self.fixedLineWidth && self.fixedLineWidth < lineRect.size.width) {
        lineFrame = CGRectMake((lineRect.size.width - self.fixedLineWidth) * 0.5, 0, self.fixedLineWidth, 3);
        lineFrame.size.width = self.fixedLineWidth < lineRect.size.width ? self.fixedLineWidth : lineRect.size.width;
    }
    
    self.lineView.frame = lineFrame;
    self.lineView.backgroundColor = self.selectLineColor;
    if (self.fixedLineWidth) {
        self.lineView.layer.cornerRadius = 1.5;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.lineView.bottom != self.bounds.size.height) {
        self.lineView.bottom = self.bounds.size.height - 7;
    }
    
    self.bottomLineView.frame = CGRectMake(0, self.bounds.size.height - 0.5, self.bounds.size.width, 0.5);
}

- (void)touchTitleBtn:(UIControl*)touch
{
    UIView *touchSuper = touch.superview;
    for (NSInteger i = 0; i < self.btnArr.count; i++) {
        PRTriangleCaptionBtn *btn = self.btnArr[i];
        if (btn == touchSuper) {
            if (self.selectIndex != i) {
                _selectIndex = i;
                [self updateView:self.selectIndex animate:YES];
                if ([self.delegate respondsToSelector:@selector(navisegment:touchIndex:)]) {
                    [self.delegate navisegment:self touchIndex:self.selectIndex];
                }
            } else {
                if ([self.delegate respondsToSelector:@selector(navisegment:touchSameIndex:)]) {
                    [self.delegate navisegment:self touchSameIndex:self.selectIndex];
                }
            }
        }
    }
    
}

// 选中了 index 项目
- (void)updateView:(NSInteger)index
{
    [self updateView:index animate:NO];
}
// 选中了 index 项目
- (void)updateView:(NSInteger)index animate:(BOOL)animated
{
    if (index >= self.btnArr.count) {
        return;
    }
    
    PRTriangleCaptionBtn *selectBtn = self.btnArr[index];
    if (m_updateSelect == index && selectBtn.isSelected) { return; }
    m_updateSelect = index;
    
    if(!selectBtn) { return; }
    [selectBtn setCaptionBtnTitleColor:self.titleHightColor forSelectState:YES];
    [selectBtn setCaptionTitleTopFont:self.titleSelectFont];
    [selectBtn updateCaptionState:YES];
    for (NSInteger i = 0; i < self.btnArr.count; i++) {
        PRTriangleCaptionBtn* normalBtn = self.btnArr[i];
        if (normalBtn && index != i) {
            [normalBtn setCaptionBtnTitleColor:self.titleColor forSelectState:NO];
            [normalBtn setCaptionTitleTopFont:self.titleFont];
            [normalBtn updateCaptionState:NO];
        }
    }
    
    CGRect rc = self.lineView.frame;
    if (self.fixedLineWidth) {
        rc.size.width = (self.fixedLineWidth > selectBtn.frame.size.width) ? selectBtn.frame.size.width : self.fixedLineWidth;
    } else {
        rc.size.width = selectBtn.frame.size.width;
        self.lineView.layer.cornerRadius = 0;
    }
    self.lineView.frame = rc;
    CGPoint pt = self.lineView.center;
    pt.x = selectBtn.center.x;
    
    if ([self.delegate respondsToSelector:@selector(navisegment:updateIndex:)]) {
        [self.delegate navisegment:self updateIndex:index];
    }
    
    if (animated) {
        [UIView animateWithDuration:0.1 animations:^{
            self.lineView.center = pt;
        }];
    }
    else {
        self.lineView.center = pt;
    }
    
}

- (void)setTabArr:(NSArray *)arr rect:(NSArray *)arrRc
{
    if (arrRc && arr.count != arrRc.count) {
        arrRc = nil;
    }
    
    if (self.titleArr != arr) {
        if(self.titleArr) {
            [self.titleArr removeAllObjects];
        }
        [self.titleArr addObjectsFromArray:arr];
    }
    
    if (self.titleRcctArr) {
        [self.titleRcctArr removeAllObjects];
    }
    
    if (arrRc) {
        [self.titleRcctArr addObjectsFromArray:arrRc];
    } else {
        NSInteger count = self.titleArr.count;
        CGFloat btnW = self.frame.size.width / count;
        CGFloat btnH = self.frame.size.height;
        for (NSInteger i = 0; i < count; i++) {
            CGRect rc = CGRectMake(i*btnW, 0, btnW, btnH);
            [self.titleRcctArr addObject:[NSValue valueWithCGRect:rc]];
        }
    }
}

-(void)adjustSubviews
{
    CGRect rc = self.frame;
    NSInteger count = self.titleArr.count;
    CGFloat btnW = rc.size.width / count;
    CGFloat btnH = rc.size.height;
    
    CGFloat lineW = btnW;
    if (self.fixedLineWidth && self.fixedLineWidth < btnW) {
        lineW = self.fixedLineWidth;
    } else {
        self.lineView.layer.cornerRadius = 0;
    }
    
    self.lineView.frame = CGRectMake(self.lineView.frame.origin.x, 0, lineW, self.lineView.frame.size.height);
    
    for (NSInteger i = 0; i < self.btnArr.count; i++) {
        UIButton* btn = self.btnArr[i];
        btn.frame = CGRectMake(i*btnW, 0, btnW, btnH);
    }
}

#pragma mark - setter
- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (selectIndex != self.selectIndex) {
        _selectIndex = selectIndex;
        [self updateView:self.selectIndex];
    }
}

-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _lineView;
}

@end
