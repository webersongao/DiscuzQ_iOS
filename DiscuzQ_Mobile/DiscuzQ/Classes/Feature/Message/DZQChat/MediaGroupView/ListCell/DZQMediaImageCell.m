//
//  DZQMediaImageCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMediaImageCell.h"

@implementation DZQMediaImageCell

-(instancetype)initWithItem:(DZQMediaGroupItem *)item{
    if(self = [super init]){
        self.delegate = self;
        self.bouncesZoom = YES;
        self.maximumZoomScale = 3;
        self.multipleTouchEnabled = YES;
        self.alwaysBounceVertical = YES;
        self.alwaysBounceHorizontal = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.frame = [UIScreen mainScreen].bounds;
        
        _item = item;
        
        _mImageView = [[UIImageView alloc]init];
        _mImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_mImageView];
        _mImageView.userInteractionEnabled = YES;
        _mImageView.contentMode = _item.contentMode;
        
        //普通图片
        if(_item.imageType == DZQImageGroupImage){
            _mImageView.image = _item.fromImage;
        }
        //gif图
        else{
            _mImageView.animationImages = _item.fromImages;
            _mImageView.animationDuration = _item.fromImages.count * 0.1;
            [_mImageView startAnimating];
        }
        
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureRecognizerPressed:)];
        gesture.numberOfTapsRequired = 1;
        gesture.numberOfTouchesRequired = 1;
        [_mImageView addGestureRecognizer:gesture];
        
    }
    return self;
}


//设置frame
-(void)setImageCellFrame:(CGRect)imageCellFrame{
    _imageCellFrame = imageCellFrame;
    self.frame = _imageCellFrame;
    _mImageView.frame = self.bounds;
}

//滚动触发
- (void)layoutSubviews {
    [super layoutSubviews];
}

//缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    UIView *subView = _mImageView;
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    subView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _mImageView;
}

//点击回收 10+
-(void)GestureRecognizerPressed:(UITapGestureRecognizer *)sender{
    if(_imageCelldelegate && [_imageCelldelegate respondsToSelector:@selector(DZQMediaImageCellImageClick:gesture:)]){
        [_imageCelldelegate DZQMediaImageCellImageClick:_item.itemTag gesture:sender];
    }
}


@end


