//
//  DZSearchListCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/7/11.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class DZSearchModel;

@interface DZSearchListCell : DZBaseTableViewCell

@property (strong, nonatomic)  UILabel *contentLabel;
@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  UILabel *evaluateLabel;

@property (nonatomic, strong,readonly) DZSearchModel *info;

-(void)updateSearchCell:(DZSearchModel *)cellModel;

- (CGFloat)caculateSearchCellHeight:(DZSearchModel *)info;

@end
