//
//  DiscoverModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DiscoverModel.h"

@interface DiscoverModel ()

@end

@implementation DiscoverModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"catlist" : [ForumNodeModel class],
             @"forumlist" : [DZBaseForumModel class],
             @"visitedforums" : [ForumNodeModel class]
    };
}

-(instancetype)formartForumNodeData{
    
    // 分类
    for (ForumNodeModel *nodeModel in self.catlist) {
        nodeModel.nodeLevel = 0;
        nodeModel.isExpanded = (self.catlist.count >= 10) ? NO : YES;
        [nodeModel childTreeNode:self.forumlist];
    }
    // 最近访问
    for (ForumNodeModel *nodeModel in self.visitedforums) {
        nodeModel.nodeLevel = 0;
        nodeModel.isExpanded = (self.catlist.count >= 10) ? NO : YES;
        [nodeModel childTreeNode:self.forumlist];
    }
    
    NSMutableArray *nodeArr = [[NSMutableArray alloc] initWithCapacity:3];
    // 分类
    for (ForumNodeModel *nodeModel in self.catlist) {
        ForumBaseNode *baseNode = [[ForumBaseNode alloc] init];
        baseNode.fidStr = nodeModel.fid;
        baseNode.nameStr = nodeModel.name;
        baseNode.subNodeList = nil;
        [nodeArr addObject:baseNode];
    }
    self.indexNodeArray = nodeArr.copy;
    
    return self;
}


@end


