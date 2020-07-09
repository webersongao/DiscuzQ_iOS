//
//  DZThreadVideo.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZVideoPicView.h"
#import "DZDDetailStyle.h"

typedef void(^backVideoBlock)(DZVideoPicView *button,DZQDataVideo *dataVideo);

@interface DZThreadVideo : UIView

@property (nonatomic, copy) backVideoBlock playBlock;

- (void)updateThreadVideo:(DZQDataThread *)Model style:(DZDHeadStyle *)localStyle;


@end

