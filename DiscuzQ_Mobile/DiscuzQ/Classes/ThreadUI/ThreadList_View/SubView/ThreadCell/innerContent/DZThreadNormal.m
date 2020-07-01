//
//  DZThreadNormal.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadNormal.h"
#import "DZPicSquareView.h"
#import "DZThreadListStyle.h"
#import "DZHtmlLabel.h"

@interface DZThreadNormal ()

@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property(nonatomic,strong) DZPicSquareView *imageSquare;

@end

@implementation DZThreadNormal

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


- (void)updateThreadNormal:(DZQPostRelationModel *)relateModel style:(DZDContentStyle *)localStyle{
    
    [self layoutNormalSubview:localStyle];
    
    [self.imageSquare updateSquareUrlList:relateModel.images grid:localStyle.kf_squareGrid];
    
    [self.contentLabel updateContent_Html:localStyle.kf_twoItem];
    
}

-(void)layoutNormalSubview:(DZDContentStyle *)layout{
                            
    self.imageSquare.frame = layout.kf_oneFrame;
    self.contentLabel.frame = layout.kf_twoFrame;
    
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
