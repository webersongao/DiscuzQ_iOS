//
//  DZVideoPicView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZVideoPicView.h"

@interface DZVideoPicView ()

@property(nonatomic,strong)UIImageView *coverImage;
@property(nonatomic,strong)UIImageView *playStateIcon;

@end

@implementation DZVideoPicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_videoPreview];
        self.userInteractionEnabled = NO;
    }
    return self;
}

-(void)config_videoPreview{
    [self addSubview:self.coverImage];
    [self addSubview:self.playStateIcon];
}



-(void)update_videoCover:(DZQDataVideo *)dataVideo{
    
    [self.coverImage dz_setImageWithURL:dataVideo.attributes.cover_url];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.coverImage.frame = self.bounds;
    self.playStateIcon.center = CGPointMake(self.width/2.f, self.height/2.f);
}

-(UIImageView *)playStateIcon{
    if (!_playStateIcon) {
        _playStateIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _playStateIcon.image = KImageNamed(@"dz_list_videoPlay");
        _playStateIcon.userInteractionEnabled = YES;
    }
    return _playStateIcon;
}

-(UIImageView *)coverImage{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _coverImage.contentMode = UIViewContentModeScaleAspectFill;
        _coverImage.backgroundColor = [UIColor blackColor];
        _coverImage.userInteractionEnabled = YES;
        _coverImage.clipsToBounds = YES;
    }
    return _coverImage;
}


@end
