//
//  DZPicSquareView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionView.h"
#import "DZDListStyle.h"

@class DZPicSquareView,DZPicSquareCell;

@protocol DZPicSquareDelegate <NSObject>
@optional

- (void)collectionView:(DZPicSquareView *)collectionView squareCcrollDidScroll:(CGFloat)offsetY;

- (void)collectionView:(DZPicSquareView *)collectionView squareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index;

@end

@interface DZPicSquareView : UICollectionView

@property(nonatomic,strong) UIView * bottomLine;
@property(nonatomic,weak) id<DZPicSquareDelegate> imgDelegate;


// 重置 列表数组数据 的唯一方法
-(void)updateSquareUrlList:(NSArray<DZQDataAttachment *>*)UrlArray grid:(DZDGridStyle *)gridStyle;

@end




