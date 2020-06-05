//
//  DZSearchListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/11.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class SearchModel;

@interface DZSearchListCell : DZBaseTableViewCell

@property (strong, nonatomic)  UILabel *contentLabel;
@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  UILabel *evaluateLabel;

@property (nonatomic, strong,readonly) SearchModel *info;

-(void)updateSearchCell:(SearchModel *)cellModel;

- (CGFloat)caculateSearchCellHeight:(SearchModel *)info;

@end
