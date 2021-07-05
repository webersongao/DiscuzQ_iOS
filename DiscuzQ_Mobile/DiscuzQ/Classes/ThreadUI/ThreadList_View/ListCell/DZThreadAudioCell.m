//
//  DZThreadAudioCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadAudioCell.h"
#import "DZThreadAudio.h"

@interface DZThreadAudioCell ()

@property (nonatomic, strong) NSIndexPath *indexPath;  //!< cellPath
@property (nonatomic, strong) DZThreadAudio *audioView;  //!< 属性注释

@end

@implementation DZThreadAudioCell


-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.audioView];
    [self config_ThreadAudioPlayAction];
}

- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadAudioCell:self.cellLayout];
    
    [self.audioView updateThreadAudio:Model style:self.cellLayout];
}


-(void)layoutThreadAudioCell:(DZThreadListStyle *)layout{
    
    self.audioView.frame = layout.kf_content;
    
}

-(void)config_ThreadAudioPlayAction{
    KWEAKSELF
    self.audioView.playBlock = ^(DZMediaPlayView * button, DZQDataVideo * dataVideo) {
        [weakSelf threadContent:button playAction:dataVideo];
    };
}

-(void)threadContent:(DZMediaPlayView *)playButton playAction:(DZQDataVideo *)dataVideo{
    NSString *currentUrl =  dataVideo.attributes.media_url;
    [[DZMediaCenter Center] Media_videoPlayWithAssetURL:currentUrl playView:playButton];
//    [[DZMediaCenter Center] Media_videoPlayWithIndexPath:self.indexPath playView:playButton];
    
}




-(DZThreadAudio *)audioView{
    if (!_audioView) {
        _audioView = [[DZThreadAudio alloc] initWithFrame:CGRectZero];
    }
    return _audioView;
}

@end
