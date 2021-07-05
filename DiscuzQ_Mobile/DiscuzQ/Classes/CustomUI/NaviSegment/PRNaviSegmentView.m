//
//  PRNaviSegmentView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/6/3.
//

#import "PRNaviSegmentView.h"

@interface PRTitleModel : NSObject

@property (nonatomic, copy) NSString *title;  //!< 属性注释
@property (nonatomic, assign) CGFloat titleW;;  //!< 属性注释
@property (nonatomic, assign) CGFloat titleX;;  //!< <#属性注释#>
@property (nonatomic, assign) CGRect titleRect;;  //!< <#属性注释#>

@end

@implementation PRTitleModel

@end


#pragma mark   /********************* PRNaviSegmentView *************************/

@interface PRNaviSegmentView ()<PRTagSegmentViewDelegate>
{
    int m_currentIndex;
}

@property (nonatomic, strong) NSArray <PRTitleModel *>*titleDataModel;  //!< 属性注释

@end

@implementation PRNaviSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isBind = NO;
        self.bounces = NO;
        [self addSubview:self.segmentView];
        [self addSubview:self.bottomScrollLine];
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

// cache: 一般在需要展示图片的时候才为 YES
-(void)updateNaviBarWithTitle:(NSArray <NSString *>*)titleArray cache:(BOOL)cache{
    
    KWEAKSELF
    NSMutableArray *muArray = [[NSMutableArray alloc] initWithArray:titleArray];
    NSDictionary *widthInfoDict = [[PRNaviTabManager shared] calculateTitleWidthinfo:muArray cache:cache Completion:^(NSDictionary *widthDict) {
        if (widthDict && widthDict.allKeys.count) {
            [weakSelf canculateSegmentWithRectDict:widthDict titleArr:muArray];
            [weakSelf.segmentView setupAllItems:YES];
        }
    }];
    
    if (widthInfoDict && widthInfoDict.allKeys.count) {
        [self canculateSegmentWithRectDict:widthInfoDict titleArr:muArray];
        
        [self.segmentView setupAllItems:NO];
    }
}


#pragma -mark PRTagSegmentViewDelegate

- (void)navisegment:(PRTagSegmentView *)segment touchIndex:(NSInteger)index{
    
    if (self.segDelegate && [self.segDelegate respondsToSelector:@selector(naviSegment:touchNaviIndex:)]) {
        [self.segDelegate naviSegment:self touchNaviIndex:index];
    }
}

- (void)navisegment:(PRTagSegmentView *)segment touchSameIndex:(NSInteger)index{
    
    if (self.segDelegate && [self.segDelegate respondsToSelector:@selector(naviSegment:touchSameNaviIndex:)]) {
        [self.segDelegate naviSegment:self touchSameNaviIndex:self.segmentView.selectIndex];
    }
}

- (void)navisegment:(PRTagSegmentView *)segment updateIndex:(NSInteger)index{
    
    // 传出事件
    if (self.segDelegate && [self.segDelegate respondsToSelector:@selector(naviSegment:updateNaviTitleIndex:)]) {
        [self.segDelegate naviSegment:self updateNaviTitleIndex:index];
    }
    // 移动位置动画
    [self selectTitleButtonAnimation:index];
    
}

- (void)selectTitleButtonAnimation:(NSInteger)index
{
    if (index < 0 || self.contentSize.width <= self.width) {
        // 如果index异常 或者 contentSize的宽度小于frame的宽度，直接返回，不用调整scrollView的contentOffset
        return;
    }
    
    PRTitleModel *titleModel = self.titleDataModel[index];
    
    CGSize contentSize = self.contentSize;
    // selItem中点到contentSize左边距离
    CGFloat selectButtonX = titleModel.titleX;
    
    // selItem中点到contentSize右边距离
    CGFloat edgeRightToSelItemCenterX = contentSize.width - selectButtonX;
    
    CGFloat targetX = 0.0;
    if (selectButtonX < self.width / 2.0) { //如果selItem中点到左边的距离小于bounds宽度的一半，scrollView滑到最左边
        targetX = 0.0;
    } else if (edgeRightToSelItemCenterX < self.width / 2.0) { //如果selItem中点到右边的距离小于bounds宽度的一半，scrollView滑到最右边
        targetX = contentSize.width - self.width;
    } else {     //将selItem置中
        targetX = selectButtonX - (self.width / 2.0) + (titleModel.titleW/2.f);
    }
    targetX = self.isBind ? 0 : targetX;
    
    [self setContentOffset:CGPointMake(targetX , 0) animated:YES];
}


-(void)canculateSegmentWithRectDict:(NSDictionary *)WidthDict titleArr:(NSArray *)titleArr{
    
    NSMutableArray *titleModelArr = [NSMutableArray array];
    
    BOOL bEqualMargin = NO;
    CGFloat allTabNameWidth = 0;
    CGFloat segmentViewWidth = 0;
    
    for (NSNumber * titleW in WidthDict.allValues) {
        allTabNameWidth += titleW.floatValue;
    }
    // 按UI标准计算出的宽度不够一屏幕的宽度时候 则间距均分
    NSInteger cateCount = titleArr.count;
   CGFloat designNameWidth = allTabNameWidth + ((kNaviMargin * (cateCount - 1) * 2) + kNaviLeftRightMargin * 2);
    bEqualMargin = (designNameWidth < self.width) ? YES : NO;
    CGFloat titleMargin = (bEqualMargin && cateCount > 1) ? (self.width - allTabNameWidth - (kNaviLeftRightMargin * 2))/ ((cateCount - 1) * 2) : kNaviMargin;
    
    NSMutableArray *titleArray = [[NSMutableArray alloc] init];
    NSMutableArray* rectArray = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < titleArr.count; index++) {
        
        NSString * titleStr = titleArr[index];
        PRTitleModel *titleModel = [[PRTitleModel alloc] init];
        
        NSNumber *titleWValue = [WidthDict objectForKey:titleStr];
        CGFloat leftMargin = (index == 0) ? kNaviLeftRightMargin : titleMargin;
        CGFloat rightMargin = (index == cateCount - 1) ? kNaviLeftRightMargin : titleMargin;
        CGFloat titleWidth = (titleWValue.floatValue + leftMargin + rightMargin);
        // CGFloat titleWidth = bEqualWidth ? (self.width/categoryCount) : (titleWValue.floatValue + titleMargin * 2);
        CGRect rect = CGRectMake(segmentViewWidth, 0, titleWidth, 44);
        
        titleModel.title = titleStr;
        titleModel.titleRect = rect;
        titleModel.titleW = titleWidth;
        titleModel.titleX = segmentViewWidth;
        segmentViewWidth += titleWidth;
        
        if (titleModel.title.length) {
            [titleModelArr addObject:titleModel];
            [titleArray addObject:titleModel.title];
            [rectArray addObject:[NSValue valueWithCGRect:rect]];
        }
    }
    
    segmentViewWidth = MAX(segmentViewWidth, self.width);
    self.segmentView.width = segmentViewWidth;
    self.contentSize = CGSizeMake(segmentViewWidth, self.height);
    if (self.WidthEqualBlock) {
        self.WidthEqualBlock(bEqualMargin);
    }
    [self.segmentView setTabArr:titleArray rect:rectArray];
    
    self.titleDataModel = [[NSArray alloc] initWithArray:titleModelArr.copy];
}

-(PRTagSegmentView *)segmentView{
    if (_segmentView == nil) {
        _segmentView = [[PRTagSegmentView alloc] initWithFrame:self.bounds screenType:kSegNormal];
        _segmentView.delegate = self;
        _segmentView.titleFont = [UIFont systemFontOfSize:15.f];
        _segmentView.fixedLineWidth = 35 * 0.5;
        _segmentView.titleSelectFont = [UIFont boldSystemFontOfSize:15.f];
        _segmentView.backgroundColor = KWhite_Color;
        _segmentView.titleColor = KColor(@"#333333", 1);
        _segmentView.titleHightColor = KDarkGreen_Color;
        _segmentView.selectLineColor = KDarkGreen_Color;
    }
    return _segmentView;
}

-(UIView *)bottomScrollLine{
    if (_bottomScrollLine == nil) {
        _bottomScrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height -0.5, self.width, 0.5)];
        _bottomScrollLine.backgroundColor = KLine_Color;
    }
    return _bottomScrollLine;
}

@end

