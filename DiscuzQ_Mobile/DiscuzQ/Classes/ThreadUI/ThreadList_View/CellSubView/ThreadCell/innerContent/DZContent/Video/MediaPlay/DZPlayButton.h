//
//  DZPlayButton.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/8.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    dz_PlayNone,
    dz_Playing,
    dz_PlayRetry,
} dz_PlayState;

@class DZMediaPlayView;
typedef void(^backVideoBlock)(DZMediaPlayView *button,DZQDataVideo *dataVideo);

@interface DZPlayButton : UIButton

@property (nonatomic, assign) dz_PlayState playState;


@end


