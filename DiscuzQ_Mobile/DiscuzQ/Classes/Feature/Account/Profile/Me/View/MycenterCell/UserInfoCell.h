//
//  UserInfoCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@interface UserInfoCell : DZBaseTableViewCell

@property (nonatomic, strong) UIImageView *headImageV;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *groupLabel;
@property (nonatomic, strong) UIButton *editHeadBtn;

@end
