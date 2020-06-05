//
//  DZPicSquareCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPicSquareCell.h"

@interface DZPicSquareCell ()

@property (nonatomic, strong) UIImageView *imagePic;  //!< 属性注释

@end

@implementation DZPicSquareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imagePic];
    }
    return self;
}

-(void)updatePicSquareCell:(DZQDataAttachment *)attachModel{
    
    [self.imagePic dz_setImageWithURL:attachModel.attributes.thumbUrl placeholder:KImageNamed(@"dz_list_pic_def")];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imagePic.frame = self.bounds;
}


-(UIImageView *)imagePic{
    if (!_imagePic) {
        _imagePic = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imagePic;
}

@end
