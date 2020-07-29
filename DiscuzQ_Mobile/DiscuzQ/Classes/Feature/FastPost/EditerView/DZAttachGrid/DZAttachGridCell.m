//
//  DZAttachGridCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAttachGridCell.h"

@interface DZAttachGridCell ()

@property (nonatomic, strong) UILabel *modeLabel;
@property (nonatomic, strong) UILabel *fileNameLabel;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIImageView *preThumbView;

@end

@implementation DZAttachGridCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_AttachGridCell];
    }
    return self;
}

-(void)config_AttachGridCell{
    
    [self addSubview:self.modeLabel];
    [self addSubview:self.fileNameLabel];
    [self addSubview:self.preThumbView];
    [self addSubview:self.deleteButton];
}



-(void)setFileAsset:(id)fileAsset {
    _fileAsset = fileAsset;
    if ([fileAsset isKindOfClass:[PHAsset class]]) {
        //    _asset = asset;
        //    _videoImageView.hidden = asset.mediaType != PHAssetMediaTypeVideo;
        self.modeLabel.hidden = ![[fileAsset valueForKey:@"filename"] containsString:@"GIF"];
        
    }else if ([fileAsset isKindOfClass:[NSString class]]){
        
    }
}


-(void)deleteFileButtonAction:(UIButton *)button{
    
}



- (UILabel *)modeLabel{
    if (!_modeLabel) {
        _modeLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"GIF" titleColor:KGray_Color font:KFont(10.f) textAlignment:NSTextAlignmentCenter];
    }
    return _modeLabel;
}

-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [UIButton ButtonNormalWithFrame:CGRectZero title:@"" titleFont:nil titleColor:nil normalImgPath:@"dz_list_down" touchImgPath:@"dz_list_down_h" isBackImage:YES picAlpha:1];
        [_deleteButton addTarget:self action:@selector(deleteFileButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

-(UILabel *)fileNameLabel{
    if (!_fileNameLabel) {
        _fileNameLabel = [UILabel labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(16) textAlignment:NSTextAlignmentCenter];
    }
    return _fileNameLabel;
}


-(UIImageView *)preThumbView{
    if (!_preThumbView) {
        _preThumbView = [[UIImageView alloc] init];
        _preThumbView.backgroundColor = KLightGray_Color;
    }
    return _preThumbView;
}





@end
