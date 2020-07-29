//
//  DZVideoPicView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZVideoPicView.h"

@interface DZVideoPicView ()

@property(nonatomic,strong)UIImageView *videoCover;

@end

@implementation DZVideoPicView

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
    
    [self addSubview:self.videoCover];
    [self addSubview:self.playIcon];
}



-(void)update_videoCover:(DZQDataVideo *)dataVideo{
    
    [self.videoCover dz_setImageWithURL:dataVideo.attributes.cover_url];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.videoCover.frame = self.bounds;
    self.playIcon.center = CGPointMake(self.width/2.f, self.height/2.f);
}

-(DZPlayButton *)playIcon{
    if (!_playIcon) {
        _playIcon = [[DZPlayButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
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
