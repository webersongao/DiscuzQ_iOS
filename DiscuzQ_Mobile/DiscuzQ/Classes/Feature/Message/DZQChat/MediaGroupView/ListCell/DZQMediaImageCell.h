//
//  DZQMediaImageCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"
#import "DZQMediaVideoCell.h"

/**
 图片视图的cell
 */

@protocol DZQMediaImageCellDelegate <NSObject>

//点击图片
-(void)DZQMediaImageCellImageClick:(NSInteger)index gesture:(UITapGestureRecognizer *)gesture;

@end

@interface DZQMediaImageCell : DZScrollView<UIScrollViewDelegate>

@property(nonatomic,assign)id<DZQMediaImageCellDelegate>imageCelldelegate;

//初始化cell
-(instancetype)initWithItem:(DZQMediaGroupItem *)item;
//设置frame
@property(nonatomic,assign)CGRect imageCellFrame;
//展示单位
@property(nonatomic,strong)DZQMediaGroupItem *item;
//展示图
@property(nonatomic,strong)UIImageView   *mImageView;


@end






