//
//  ForumRightCell.h
//  DiscuzQ
//
//  Created by piter on 2018/1/30.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

@class DZBaseForumModel, DZCollectButton;

typedef void(^CollectionForumBlock)(DZCollectButton *sender, DZBaseForumModel *infoModel);

@interface ForumRightCell : DZBaseTableViewCell

/**
 * 设置直接显示的cell数据
 */
- (void)updateRightCellInfo:(DZBaseForumModel *)node;

@property (nonatomic, copy) CollectionForumBlock collectionBlock;

@end
