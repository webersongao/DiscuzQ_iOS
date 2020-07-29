//
//  DZThreadHead.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZUIUserModel.h"
#import "DZThreadListModel.h"
#import "DZThreadListStyle.h"

@interface DZThreadHead : UIView

- (void)updateThreadUserBar:(DZUIUserModel *)UIModel style:(DZDUserStyle *)UserStyle;

-(void)configHeadAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel follow:(SEL)followSel;

@end


