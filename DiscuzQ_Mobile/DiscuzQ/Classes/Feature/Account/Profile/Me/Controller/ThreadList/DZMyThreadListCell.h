//
//  DZMyThreadListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/5.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class ThreeadItemModel;
@interface DZMyThreadListCell : DZBaseTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;


-(void)updateDZMyThreadListCell:(ThreeadItemModel *)model;


@end
