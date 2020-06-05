//
//  DZSubForumCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/22.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
@class ForumModel;

@interface DZSubForumCell : DZBaseTableViewCell

/**
 * 设置直接显示的cell数据
 */
- (void)setInfo:(ForumModel *)node;

@end



