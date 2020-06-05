//
//  DZMediaCenter.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaCenter.h"

@implementation DZMediaCenter

+(instancetype)Center{
    static DZMediaCenter *ins_player = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ins_player = [[DZMediaCenter alloc] init];
    });
    return ins_player;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config_mediaPlayer];
    }
    return self;
}



-(void)config_mediaPlayer{
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    /// 播放器相关
    _Player = [DZMediaPlayer playerWithPlayerManager:playerManager containerView:nil];
    /// 设置退到后台继续播放
    _Player.pauseWhenAppResignActive = NO;
}


@end
