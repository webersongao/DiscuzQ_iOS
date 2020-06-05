//
//  DZUserListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class DZUserItemModel;

@interface DZUserListCell : DZBaseTableViewCell


- (void)updateUserListCenterCell:(DZUserItemModel *)model;

@end
