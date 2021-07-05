//
//  DZAudioInfoView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAudioInfoView.h"

@interface DZAudioInfoView ()

@property(nonatomic,strong)DZQDataVideo *dataAudio;
@property (nonatomic, strong) UIButton *viewNumBtn;  //!< 播放量
@property (nonatomic, strong) UIButton *durationBtn;  //!< 时间
@property (nonatomic, strong) DZMediaPlayView *audioPlayBtn;  //!< 属性注释

@end

@implementation DZAudioInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self config_AudioinfoView];
        self.backgroundColor = KRandom_Color;
    }
    return self;
}

-(void)config_AudioinfoView{
    
    [self addSubview:self.viewNumBtn];
    [self addSubview:self.durationBtn];
    [self addSubview:self.audioPlayBtn];
    
    [self.audioPlayBtn addTarget:self action:@selector(playVideoClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)playVideoClick:(DZMediaPlayView *)button{
    if (self.playInfoBlock) {
        self.playInfoBlock(self.audioPlayBtn,self.dataAudio);
    }
}

-(void)update_AudioInfoCoverView:(DZQDataThread *)dataModel{
    
    self.dataAudio = dataModel.relationships.threadAudio;
    
    [self.audioPlayBtn update_MediaCover:self.dataAudio];
    
    [self.viewNumBtn setTitle:checkTwoStr(@"浏览：", checkIntegerStr(dataModel.attributes.viewCount)) forState:UIControlStateNormal];
    [self.durationBtn setTitle:checkTwoStr(@"时长：", checkFloat(self.dataAudio.attributes.duration)) forState:UIControlStateNormal];
    
    [self layoutAudioInfoSubviews];
    
}

-(void)layoutAudioInfoSubviews{
    
    self.viewNumBtn.top = self.height - kMargin30;
    self.durationBtn.top = self.height - kMargin30;
    self.audioPlayBtn.left = self.width - (70 + kMargin15);
    [self.audioPlayBtn update_MediaPlayIconSize:CGSizeMake(40, 40)];
    
}

-(DZMediaPlayView *)audioPlayBtn{
    if (!_audioPlayBtn) {
        _audioPlayBtn = [[DZMediaPlayView alloc] initWithFrame:CGRectMake(0, kMargin15, 70, 70)];
        _audioPlayBtn.layer.cornerRadius = 5.0;
        _audioPlayBtn.clipsToBounds = YES;
    }
    return _audioPlayBtn;
}


-(UIButton *)viewNumBtn{
    if (!_viewNumBtn) {
        _viewNumBtn = [UIButton ButtonTextWithFrame:CGRectMake(kMargin15, 0, 90, 15) titleStr:@"浏览：" titleColor:KLightContent_Color titleTouColor:KLightContent_Color font:KFont(12) Radius:2.f Target:self action:nil];
        _viewNumBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _viewNumBtn;
}

-(UIButton *)durationBtn{
    if (!_durationBtn) {
        _durationBtn = [UIButton ButtonTextWithFrame:CGRectMake((100 + kMargin30), 0, 90, 15) titleStr:@"时长：" titleColor:KLightContent_Color titleTouColor:KLightContent_Color font:KFont(14) Radius:2.f Target:self action:nil];
        _durationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _durationBtn;
}



@end
