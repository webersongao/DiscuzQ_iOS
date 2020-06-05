//
//  DZMediaCenter.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZMediaPlayer.h"

@interface DZMediaCenter : NSObject

+(instancetype)Center;

@property (nonatomic,strong,readonly) DZMediaPlayer *Player;  //!< 属性注释


@end


