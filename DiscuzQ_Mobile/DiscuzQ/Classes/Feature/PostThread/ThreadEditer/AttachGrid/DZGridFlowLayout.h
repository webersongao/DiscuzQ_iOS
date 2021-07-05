//
//  DZGridFlowLayout.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZGridFlowLayout : UICollectionViewFlowLayout

- (instancetype)initWithWidth:(CGFloat)GridWidth WHScale:(CGFloat)scale;

@property (nonatomic,assign) BOOL panGestureRecognizerEnable;

@end

@protocol LxGridViewDataSource <UICollectionViewDataSource>

@optional

- (void)collectionView:(UICollectionView *)collectionView
       itemAtIndexPath:(NSIndexPath *)sourceIndexPath
   willMoveToIndexPath:(NSIndexPath *)destinationIndexPath;
- (void)collectionView:(UICollectionView *)collectionView
       itemAtIndexPath:(NSIndexPath *)sourceIndexPath
    didMoveToIndexPath:(NSIndexPath *)destinationIndexPath;

- (BOOL)collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL)collectionView:(UICollectionView *)collectionView
       itemAtIndexPath:(NSIndexPath *)sourceIndexPath
    canMoveToIndexPath:(NSIndexPath *)destinationIndexPath;

@end

@protocol LxGridViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@optional

- (void)collectionView:(UICollectionView *)collectionView
                layout:(UICollectionViewLayout *)collectionViewLayout
willBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView
                layout:(UICollectionViewLayout *)collectionViewLayout
didBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView
                layout:(UICollectionViewLayout *)collectionViewLayout
willEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView
                layout:(UICollectionViewLayout *)collectionViewLayout
didEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath;

@end
