//
//  DZNotiDetailCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/4.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZNotiListStyle.h"

@interface DZNotiDetailCell : DZBaseTableViewCell

-(void)updateMsgDetailCell:(DZQDataNoti *)NotiModel;

@end
