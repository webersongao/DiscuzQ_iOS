//
//  DZThreadBottomBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDListStyle.h"

@interface DZThreadBottomBar : UIView

-(void)updateBottombarLayout:(DZDToolBarStyle *)modelLayout;

-(void)configBarAction:(id)target like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel;


@end


