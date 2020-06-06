//
//  HomeCollectionView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "HomeCollectionView.h"

static NSString * const cellIdentifier = @"DZThreadCell";

@interface HomeCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UIView * bottomLine;
@property(nonatomic,strong,readonly) NSArray <DZQDataCate *> *dataArray;

@end

@implementation HomeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self configHomeCollectionView];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:cellIdentifier];
    }
    return self;
}


-(void)configHomeCollectionView{
    [self addSubview:self.bottomLine];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressRecognizerAction:)];
    [self addGestureRecognizer:longPress];
}

// 重置 列表数组数据 的唯一方法
-(void)reloadDataSource:(NSArray <DZQDataCate *>*)array{
    if (array && [array isKindOfClass:[NSArray class]]) {
        _dataArray = array;
    }
    self.hidden = self.dataArray.count ? NO : YES;
    [self reloadHomeListThreadData];
}


// 列表刷新
-(void)reloadHomeListThreadData{
    [self reloadSections:[NSIndexSet indexSetWithIndex:0]];
}


/// 长按手势
-(void)lonePressRecognizerAction:(UILongPressGestureRecognizer *)longPressGes{
    if (longPressGes.state == UIGestureRecognizerStateBegan) {
        NSIndexPath *indexPath = [self indexPathForItemAtPoint:[longPressGes locationInView:self]];
        HomeCollectionCell *cell = (HomeCollectionCell *)[self cellForItemAtIndexPath:indexPath];
        if (cell && self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionView:longPressItemCell:)]) {
            [self.headerDelegate collectionView:self longPressItemCell:cell];
        }
    }
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionCell *homeCell = (HomeCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [homeCell updateForumCellWithModel:self.dataArray[indexPath.row]];

    return homeCell;
}

#pragma mark <UICollectionViewDelegate>
/// 点击某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionCell *itemCell = (HomeCollectionCell *)[self cellForItemAtIndexPath:indexPath];
    
    if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionView:didSelectItemCell:)]) {
        [self.headerDelegate collectionView:self didSelectItemCell:itemCell];
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionView:scrollDidScroll:)]) {
        [self.headerDelegate collectionView:self scrollDidScroll:offsetY];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionView:scrollDidScroll:)]) {
        [self.headerDelegate collectionViewWillBeginDragging];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionViewDidEndScroll)]) {
        [self.headerDelegate collectionViewDidEndScroll];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.headerDelegate && [self.headerDelegate respondsToSelector:@selector(collectionViewDidEndScroll)]) {
            [self.headerDelegate collectionViewDidEndScroll];
        }
    }
}





-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, self.width, 0.5)];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}






@end
