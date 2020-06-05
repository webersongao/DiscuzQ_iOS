//
//  ForumNodeModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForumModel.h"
#import "ForumBaseNode.h"

@interface ForumNodeModel : ForumBaseNode

@property (nonatomic, copy) NSString *fid;  //!< 属性注释
@property (nonatomic, copy) NSString *name;  //!< 属性注释
@property (nonatomic, strong) NSArray<NSString *> *forums;  //!< 属性注释

@property (nonatomic) BOOL isExpanded;  // 展开状态 NO 开始的时候全部收起， YES 开始的时候全部展开；
@property (nonatomic) NSUInteger nodeLevel; // 级别
@property (nonatomic, strong) DZBaseForumModel *infoModel;
@property (nonatomic, strong) NSArray<ForumNodeModel *> *childNode;


- (NSArray *)childTreeNode:(NSArray *)forumlist;

- (NSArray<ForumNodeModel *> *)childSubTreeNode:(NSArray<DZBaseForumModel *>*)subList;

@end


