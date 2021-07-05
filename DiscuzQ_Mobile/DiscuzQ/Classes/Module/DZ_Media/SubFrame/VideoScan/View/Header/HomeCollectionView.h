//
//  HomeCollectionView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaHeader.h"
#import "HomeCollectionCell.h"

@class HomeCollectionView,HomeCollectionCell;
@protocol HeaderCollectionDelegate <NSObject>
@optional
- (void)collectionView:(HomeCollectionView *)collectionView didSelectItemCell:(HomeCollectionCell *)itemCell;

- (void)collectionView:(HomeCollectionView *)collectionView longPressItemCell:(HomeCollectionCell *)itemCell;

- (void)collectionView:(HomeCollectionView *)collectionView scrollDidScroll:(CGFloat)offsetY;

- (void)collectionViewWillBeginDragging;

- (void)collectionViewDidEndScroll;

@end

@interface HomeCollectionView : UICollectionView


@property(nonatomic,weak) id<HeaderCollectionDelegate> headerDelegate;


// 重置 列表数组数据 的唯一方法
-(void)reloadDataSource:(NSArray <DZThreadCateM *>*)array;

@end


