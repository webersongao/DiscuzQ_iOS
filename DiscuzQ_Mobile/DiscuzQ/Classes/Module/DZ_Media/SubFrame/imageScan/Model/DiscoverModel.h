//
//  DiscoverModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseVarModel.h"
#import "ForumNodeModel.h"
#import "DZBaseForumModel.h"


@interface DiscoverModel : NSObject

// 板块数组
@property (nonatomic, strong) NSArray<DZBaseForumModel *> *forumlist;  // 所有的板块
// 论坛板块分类
@property (nonatomic, strong) NSArray<ForumNodeModel *> *catlist;  // 板块分类节点
// 论坛板块 访问足迹
@property (nonatomic, strong) NSArray<ForumNodeModel *> *visitedforums;

// 自定义属性
@property (nonatomic, strong) NSArray<ForumBaseNode *> *indexNodeArray;  // 节点 符合 级联菜单顺序

-(instancetype)formartForumNodeData;

@end


