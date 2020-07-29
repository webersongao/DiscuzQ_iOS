//
//  DZNotificationListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZNotiItem.h"

@interface DZNotificationListCell : DZBaseTableViewCell


- (void)updateMessageListCell:(DZNotiItem *)cellModel;



@end

