//
//  CollectionViewCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/10/21.
//  Copyright © 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@interface CollectionViewCell : DZBaseTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

-(void)setData:(NSDictionary*)dic;
@end
