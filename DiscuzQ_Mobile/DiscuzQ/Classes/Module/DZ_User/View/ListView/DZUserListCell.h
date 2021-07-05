//
//  DZUserListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class DZUserItemModel;

@interface DZUserListCell : DZBaseTableViewCell


- (void)updateUserListCenterCell:(DZUserItemModel *)model;

@end
