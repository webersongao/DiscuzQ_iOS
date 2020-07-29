//
//  DZRootForumCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/23.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
@class ForumNodeModel;

@interface DZRootForumCell : DZBaseTableViewCell

@property (nonatomic, strong) ForumNodeModel * node;
@property (nonatomic, strong) UILabel *textLab;
@property (nonatomic, strong) UIButton * button;

@end
