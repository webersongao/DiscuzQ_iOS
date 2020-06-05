//
//  ForumItemCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/2.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"
@class DZBaseForumModel;

@interface ForumItemCell : DZBaseCollectionCell

/**
 * 设置直接显示的cell数据
 */
- (void)updateItemCell:(DZBaseForumModel *)node;

@end
