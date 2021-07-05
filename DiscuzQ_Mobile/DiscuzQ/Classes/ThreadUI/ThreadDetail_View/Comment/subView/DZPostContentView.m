//
//  DZPostContentView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostContentView.h"
#import "DZPicSquareView.h"
#import "DZThreadListStyle.h"
#import "DZThreadHelper.h"
#import "DZHtmlLabel.h"

@interface DZPostContentView ()<DZPicSquareDelegate>

@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property(nonatomic,strong) DZPicSquareView *imageSquare;

@end

@implementation DZPostContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_normalView];
    }
    return self;
}

-(void)config_normalView{
    
    [self addSubview:self.imageSquare];
    [self addSubview:self.contentLabel];
}


- (void)updatePostContent:(DZQPostRelationV1 *)relateModel style:(DZDContentStyle *)localStyle{
    
    [self layoutNormalSubview:localStyle];
    
    [self.contentLabel updateContent_Html:localStyle.kf_contentItem];
    
    self.imageSquare.imgDelegate = nil;
    self.imageSquare.imgDelegate = self;
    [self.imageSquare updateSquareUrlList:relateModel.images grid:localStyle.kf_squareGrid];
}

-(void)layoutNormalSubview:(DZDContentStyle *)layout{
                            
    self.contentLabel.frame = layout.kf_contentFrame;
    self.imageSquare.frame = layout.kf_mediaFrame;
    
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

@end
