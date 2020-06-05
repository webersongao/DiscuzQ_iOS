//
//  DZPicSquareView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZPicSquareView.h"
#import "DZPicSquareCell.h"

static NSString * const cellIdentifier = @"DZPicSquareCell";

@interface DZPicSquareView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) DZDGridStyle *gridStyle;  //!< 布局参数
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *dataArray;  //!< 属性注释

@end

@implementation DZPicSquareView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self configHomeCollectionView];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[DZPicSquareCell class] forCellWithReuseIdentifier:cellIdentifier];
    }
    return self;
}


-(void)configHomeCollectionView{
    [self addSubview:self.bottomLine];
}

// 重置 列表数组数据 的唯一方法
-(void)updateSquareUrlList:(NSArray<DZQDataAttachment *>*)UrlArray grid:(DZDGridStyle *)gridStyle{
    if (UrlArray && [UrlArray isKindOfClass:[NSArray class]]) {
        _dataArray = UrlArray;
        _gridStyle = gridStyle;
    }
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
        DZPicSquareCell *cell = (DZPicSquareCell *)[self cellForItemAtIndexPath:indexPath];
        if (cell && self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionView:longPressItemCell:)]) {
            [self.imgDelegate collectionView:self longPressItemCell:cell];
        }
    }
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DZPicSquareCell *homeCell = (DZPicSquareCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [homeCell updatePicSquareCell:self.dataArray[indexPath.item]];

    return homeCell;
}

#pragma mark <UICollectionViewDelegate>
/// 点击某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DZPicSquareCell *itemCell = (DZPicSquareCell *)[self cellForItemAtIndexPath:indexPath];
    
    if (self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionView:didSelectItemCell:)]) {
        [self.imgDelegate collectionView:self didSelectItemCell:itemCell];
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionView:scrollDidScroll:)]) {
        [self.imgDelegate collectionView:self scrollDidScroll:offsetY];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionView:scrollDidScroll:)]) {
        [self.imgDelegate collectionViewWillBeginDragging];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionViewDidEndScroll)]) {
        [self.imgDelegate collectionViewDidEndScroll];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (self.imgDelegate && [self.imgDelegate respondsToSelector:@selector(collectionViewDidEndScroll)]) {
            [self.imgDelegate collectionViewDidEndScroll];
        }
    }
}


#pragma mark   /********************* UICollectionViewDelegateFlowLayout 布局 *************************/

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kDis_PicCellWH, kDis_PicCellWH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(kMargin10,0, kMargin10, 0);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return kMargin5-1;  // 行间距 (上下间隔)
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return kMargin5-1;  // 列间距 (左右间隔)
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//
//    return CGSizeMake(0, 0);
//
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//
//    return CGSizeMake(0, 0);
//
//}




-(UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, self.width, 0.5)];
        _bottomLine.backgroundColor = KLine_Color;
    }
    return _bottomLine;
}











@end
