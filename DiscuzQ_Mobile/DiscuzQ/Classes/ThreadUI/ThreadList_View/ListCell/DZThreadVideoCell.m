//
//  DZThreadVideoCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadVideoCell.h"
#import "DZThreadVideo.h"

@interface DZThreadVideoCell ()

@property (nonatomic, strong) NSIndexPath *indexPath;  //!< cellPath
@property (nonatomic, strong) DZThreadVideo *videoView;  //!< 视频主题（文字 + 视频）

@end

@implementation DZThreadVideoCell


-(void)config_ThreadBaseListCell{
    [super config_ThreadBaseListCell];
    [self.contentView addSubview:self.videoView];
    [self config_ThreadVideoAction];
}

-(void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [super updateThreadListCell:Model IndexPath:indexPath];
    [self layoutThreadVideoCell:self.cellLayout];
    
    [self.videoView updateThreadVideo:Model style:self.cellLayout];
    
}


-(void)layoutThreadVideoCell:(DZThreadListStyle *)layout{
    
    self.videoView.frame = layout.kf_content;
    
}


-(void)config_ThreadVideoAction{
    KWEAKSELF
    self.videoView.playBlock = ^(DZMediaPlayView * button, DZQDataVideo * dataVideo) {
        [weakSelf threadContent:button playAction:dataVideo];
        
    };
}

-(void)threadContent:(DZMediaPlayView *)playButton playAction:(DZQDataVideo *)dataVideo{

    [[DZMediaCenter Center] Media_videoPlayWithIndexPath:self.indexPath playView:playButton];
    
}


-(DZThreadVideo *)videoView{
    if (!_videoView) {
        _videoView = [[DZThreadVideo alloc] initWithFrame:CGRectZero];
    }
    return _videoView;
}





@end
