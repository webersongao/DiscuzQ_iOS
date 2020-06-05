//
//  BoundManageCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/7/13.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class DZHorizontalButton,BindUser;

@interface BoundManageCell : DZBaseTableViewCell

@property (nonatomic, strong) DZHorizontalButton *nameV;
@property (nonatomic, strong) UIButton *detailBtn;

- (void)updateCellData:(BindUser *)model;

@end
