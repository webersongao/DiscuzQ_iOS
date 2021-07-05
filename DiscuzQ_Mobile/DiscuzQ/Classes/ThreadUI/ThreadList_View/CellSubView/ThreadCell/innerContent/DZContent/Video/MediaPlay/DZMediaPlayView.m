//
//  DZMediaPlayView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaPlayView.h"

@interface DZMediaPlayView ()

@property (nonatomic, assign) CGSize iconSize;  //!< 属性注释
@property(nonatomic,strong)DZPlayButton *playIcon;
@property(nonatomic,strong)UIImageView *videoCover;

@end

@implementation DZMediaPlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        [self config_videoPreview];
    }
    return self;
}

-(void)config_videoPreview{
    
    self.iconSize = CGSizeMake(60, 60);
    [self addSubview:self.videoCover];
    [self addSubview:self.playIcon];
}

-(void)update_MediaState:(dz_PlayState)mediaState{
    self.playIcon.playState = mediaState;
}


-(void)update_MediaCover:(DZQDataVideo *)dataVideo{
    
    [self.videoCover dz_setImageWithURL:dataVideo.attributes.cover_url placeholder:KImageNamed(DZQ_Square_icon)];
}

-(void)update_MediaPlayIconSize:(CGSize)iconSize{
    self.iconSize = iconSize;
    self.playIcon.size = iconSize;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.videoCover.frame = self.bounds;
    self.playIcon.center = CGPointMake(self.width/2.f, self.height/2.f);
}

-(DZPlayButton *)playIcon{
    if (!_playIcon) {
        _playIcon = [[DZPlayButton alloc] initWithFrame:CGRectMake(0, 0, self.iconSize.width,self.iconSize.height)];
        [_playIcon setBackgroundImage:KImageNamed(@"dz_list_videoPlay") forState:UIControlStateNormal];
        _playIcon.userInteractionEnabled = NO;
    }
    return _playIcon;
}

-(UIImageView *)videoCover{
    if (!_videoCover) {
        _videoCover = [[UIImageView alloc] initWithFrame:CGRectZero];
        _videoCover.contentMode = UIViewContentModeScaleAspectFill;
        _videoCover.backgroundColor = KGray_Color;
    }
    return _videoCover;
}


@end
