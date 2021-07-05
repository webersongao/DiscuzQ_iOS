//
//  DZThreadAudio.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadAudio.h"
#import "DZHtmlLabel.h"
#import "DZAudioInfoView.h"

@interface DZThreadAudio ()

@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property (nonatomic, strong) DZAudioInfoView *audioView;  //!< 属性注释

@end

@implementation DZThreadAudio

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_AudioView];
    }
    return self;
}

-(void)config_AudioView{
    
    [self addSubview:self.audioView];
    [self addSubview:self.contentLabel];
}

- (void)updateThreadAudio:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle{

    [self layoutAudioSubView:localStyle.frame_content];
    
    [self.audioView update_AudioInfoCoverView:Model];
    
    [self.contentLabel updateContent_Html:localStyle.frame_content.kf_contentItem];
}



-(void)layoutAudioSubView:(DZDContentStyle *)layout{
    
    self.contentLabel.frame = layout.kf_contentFrame;
    self.audioView.frame = layout.kf_mediaFrame;
    
}

-(DZAudioInfoView *)audioView{
    if (!_audioView) {
        _audioView = [[DZAudioInfoView alloc] initWithFrame:CGRectZero];
        KWEAKSELF
        _audioView.playInfoBlock = ^(DZMediaPlayView *button, DZQDataVideo *dataVideo) {
            if (weakSelf.playBlock) {
                weakSelf.playBlock(button,dataVideo);
            }
        };
    }
    return _audioView;
}

-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}



@end
