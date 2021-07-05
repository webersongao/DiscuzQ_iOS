//
//  DZThreadGoods.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadGoods.h"
#import "DZPicSquareView.h"
#import "DZThreadListStyle.h"
#import "DZThreadHelper.h"
#import "DZHtmlLabel.h"
#import "DZGoodsView.h"

@interface DZThreadGoods ()<DZPicSquareDelegate>

@property(nonatomic,strong) DZGoodsView *goodsView;
@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property(nonatomic,strong) DZPicSquareView *imageSquare;

@end

@implementation DZThreadGoods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_normalView];
    }
    return self;
}

-(void)config_normalView{
    
    [self addSubview:self.goodsView];
    [self addSubview:self.imageSquare];
    [self addSubview:self.contentLabel];
}


- (void)updateThreadGoods:(DZQPostRelationV1 *)relateModel style:(DZDContentStyle *)localStyle{
    
    [self layoutNormalSubview:localStyle];
    
    [self.contentLabel updateContent_Html:localStyle.kf_contentItem];
    
    self.imageSquare.imgDelegate = nil;
    self.imageSquare.imgDelegate = (relateModel.images.count) ? self : nil;;
    [self.imageSquare updateSquareUrlList:relateModel.images grid:localStyle.kf_squareGrid];
    
    self.goodsView.hidden = (relateModel.images.count) ? YES : NO;
    self.imageSquare.hidden = (relateModel.images.count) ? NO : YES;
    
    [self.goodsView updateGoodsView:relateModel.postGoods layoutH:localStyle.kf_mediaFrame.size.height];
    
}

-(void)layoutNormalSubview:(DZDContentStyle *)layout{
                            
    self.contentLabel.frame = layout.kf_contentFrame;
    self.imageSquare.frame = layout.kf_mediaFrame;
    self.goodsView.frame = layout.kf_mediaFrame;
    
}

#pragma mark DZPicSquareDelegate

- (void)collectionView:(DZPicSquareView *)collectionView squareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index{
    
    [DZThreadHelper touchThreadPicSquareData:attachArray DidSelectItem:index];
}





-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}

-(DZPicSquareView *)imageSquare{
    if (!_imageSquare) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _imageSquare = [[DZPicSquareView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _imageSquare;
}

-(DZGoodsView *)goodsView{
    if (!_goodsView) {
        _goodsView = [[DZGoodsView alloc] initWithFrame:CGRectZero];
    }
    return _goodsView;
}

@end
