//
//  DZAttachGridCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAttachGridCell.h"
#import "DZMediaModel.h"

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
        self.backgroundColor = KLightGray_Color;
    }
    return self;
}

-(void)config_AttachGridCell{
    
    [self addSubview:self.preThumbView];
    [self addSubview:self.modeLabel];
    [self addSubview:self.fileNameLabel];
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


-(void)updateDraftAttachListCell:(DZMediaModel *)dataItem{
    
    self.modeLabel.text = dataItem.mediaTypeStr;
    [self.modeLabel sizeToFit];
    self.fileNameLabel.text = dataItem.mediaName;
    self.preThumbView.image = KImageNamed(dataItem.thumbPath);
    self.modeLabel.size = CGSizeMake(self.modeLabel.width + kMargin5, self.modeLabel.height);
    
}


-(void)deleteFileButtonAction:(UIButton *)button{
    NSLog(@"WBS  删除文件");
}



- (UILabel *)modeLabel{
    if (!_modeLabel) {
        _modeLabel = [DZLabel dz_labelWithFrame:CGRectMake(kMargin5, kMargin5, 0, 0) title:@"GIF" titleColor:KWhite_Color font:KFont(10.f) textAlignment:NSTextAlignmentCenter];
        _modeLabel.backgroundColor = KAlphaColor(KGray_Color, 0.5);
        _modeLabel.layer.cornerRadius = 2.0;
        _modeLabel.layer.masksToBounds = YES;
    }
    return _modeLabel;
}

-(UIButton *)deleteButton{
    if (!_deleteButton) {
        _deleteButton = [UIButton ButtonNormalWithFrame:CGRectMake(self.width-kMargin20, kMargin5, 15, 15) title:@"" titleFont:nil titleColor:nil normalImgPath:@"type_close_gray" touchImgPath:@"type_close_gray" isBackImage:YES picAlpha:1];
        [_deleteButton addTarget:self action:@selector(deleteFileButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.layer.cornerRadius = 7.5;
        _deleteButton.layer.masksToBounds = YES;
        _deleteButton.backgroundColor = KAlphaColor(UIColor.redColor, 0.5);
    }
    return _deleteButton;
}



-(UILabel *)fileNameLabel{
    if (!_fileNameLabel) {
        _fileNameLabel = [UILabel labelWithFrame:CGRectMake(kMargin5, self.height - kMargin20, self.width-kMargin10, 15) title:@"" titleColor:KGray_Color font:KFont(10) textAlignment:NSTextAlignmentLeft];
    }
    return _fileNameLabel;
}


-(UIImageView *)preThumbView{
    if (!_preThumbView) {
        _preThumbView = [[UIImageView alloc] initWithFrame:self.bounds];
        _preThumbView.layer.cornerRadius = 3.0;
        _preThumbView.layer.masksToBounds = YES;
    }
    return _preThumbView;
}





@end
