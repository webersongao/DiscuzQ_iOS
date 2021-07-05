//
//  DZThreadVideo.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadVideo.h"
#import "DZThreadListStyle.h"
#import "DZHtmlLabel.h"

@interface DZThreadVideo ()

@property(nonatomic,strong) DZQDataVideo *dataVideo;
@property(nonatomic,strong) DZHtmlLabel *contentLabel;
@property(nonatomic,strong) DZMediaPlayView *videoView;

@end

@implementation DZThreadVideo

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_videoView];
    }
    return self;
}

-(void)config_videoView{
    
    [self addSubview:self.videoView];
    [self addSubview:self.contentLabel];
    [self.videoView addTarget:self action:@selector(playVideoClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateThreadVideo:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle{
    
    self.dataVideo = Model.relationships.threadVideo;
    [self layoutVideoSubview:localStyle.frame_content];
    
    [self.videoView update_MediaCover:self.dataVideo];
    
    [self.contentLabel updateContent_Html:localStyle.frame_content.kf_contentItem];

}

-(void)layoutVideoSubview:(DZDContentStyle *)layout{
    
    self.contentLabel.frame = layout.kf_contentFrame;
    self.videoView.frame = layout.kf_mediaFrame;
}


-(void)playVideoClick:(DZMediaPlayView *)button{
    if (self.playBlock) {
        self.playBlock(button,self.dataVideo);
    }
}

-(DZMediaPlayView *)videoView{
    if (!_videoView) {
        _videoView = [[DZMediaPlayView alloc] initWithFrame:CGRectZero];
        _videoView.layer.borderWidth = 1.f;
        _videoView.layer.cornerRadius = 3.f;
        _videoView.layer.masksToBounds = YES;
        _videoView.tag = kPlayerViewTag;
        _videoView.layer.borderColor = KGray_Color.CGColor;
    }
    return _videoView;
}

-(DZHtmlLabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contentLabel;
}


@end
