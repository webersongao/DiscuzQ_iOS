//
//  DZPlayButton.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/8.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPlayButton.h"

@implementation DZPlayButton



-(void)setPlayState:(dz_PlayState)playState{
    if (playState == dz_PlayNone) {
        [self setBackgroundImage:KImageNamed(@"dz_list_videoPlay") forState:UIControlStateNormal];
    }else if (playState == dz_Playing){
        // 播放中
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else if (playState == dz_PlayRetry){
        [self setBackgroundImage:KImageNamed(@"dz_list_videoPlay") forState:UIControlStateNormal];
    }else{
       [self setBackgroundImage:KImageNamed(@"dz_list_videoPlay") forState:UIControlStateNormal];
    }
}

@end
