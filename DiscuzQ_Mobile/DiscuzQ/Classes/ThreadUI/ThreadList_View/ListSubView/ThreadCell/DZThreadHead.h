//
//  DZThreadHead.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZThreadListModel.h"
#import "DZThreadListStyle.h"

@interface DZThreadHead : UIView

- (void)updateThreadUserBar:(DZQDataThread *)relateModel style:(DZDHeadStyle *)listStyle;

-(void)configHeadAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel;

@end


