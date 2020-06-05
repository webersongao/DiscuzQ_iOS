//
//  MyReplyViewControllerCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/9/2.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@interface MyReplyViewControllerCell : DZBaseTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

-(void)setData:(NSDictionary*)dic;


@end
