//
//  DZMediaPlayView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZPlayButton.h"

@interface DZMediaPlayView : UIButton

typedef void(^backVideoBlock)(DZMediaPlayView *button,DZQDataVideo *dataVideo);

-(void)update_MediaPlayIconSize:(CGSize)iconSize;

-(void)update_MediaState:(dz_PlayState)mediaState;

-(void)update_MediaCover:(DZQDataVideo *)dataVideo;


@end


