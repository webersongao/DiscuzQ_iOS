//
//  DZMediaCenter.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaCenter.h"

@interface DZMediaCenter ()


@end

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
    
   
    
}






- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.prepareShowLoading = YES;
    }
    return _controlView;
}

@end
