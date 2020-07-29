//
//  DZVideoPicView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZPlayButton.h"

@interface DZVideoPicView : UIButton

typedef void(^backVideoBlock)(DZVideoPicView *button,DZQDataVideo *dataVideo);


@property(nonatomic,strong)DZPlayButton *playIcon;

-(void)update_videoCover:(DZQDataVideo *)dataVideo;


@end


