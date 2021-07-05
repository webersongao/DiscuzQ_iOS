//
//  DZThreadHead.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZUIUserModel.h"
#import "DZThreadListStyle.h"

@interface DZThreadHead : UIView

- (void)updateThreadUserBar:(DZUIUserModel *)UIModel style:(DZDUserStyle *)UserStyle;

-(void)configHeadAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel follow:(SEL)followSel;

@end


