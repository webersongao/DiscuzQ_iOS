//
//  DZPlayButton.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/8.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    dz_PlayNone,
    dz_Playing,
    dz_PlayRetry,
} dz_PlayState;

@interface DZPlayButton : UIButton

@property (nonatomic, assign) dz_PlayState playState;


@end


