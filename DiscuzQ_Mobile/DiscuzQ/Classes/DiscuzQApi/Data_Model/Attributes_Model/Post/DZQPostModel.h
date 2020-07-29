//
//  DZQPostModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  单条主题 内容字段

#import "DZQSuperModel.h"
#import "DZQBaseUser.h"
#import "DZQPostRelationModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQPostModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *replyUserId;  //!< 所回复的用户 ID
@property (nonatomic, copy) NSString *summary;  //!< 摘要
@property (nonatomic, copy) NSString *summaryText;  //!< 摘要
@property (nonatomic, copy) NSString *content;  //!< 内容
@property (nonatomic, copy) NSString *contentHtml;  //!< html 内容

@property (nonatomic, copy) NSString *ip;  //!< 发布 ip
@property (nonatomic, copy) NSString *port;  //!< 端口

@property (nonatomic, copy) NSString *longitude;  //!< 经度
@property (nonatomic, copy) NSString *latitude;  //!< 维度

@property (nonatomic, assign) NSInteger replyCount;  //!< 回复数
@property (nonatomic, assign) NSInteger likeCount;  //!< 喜欢数

@property (nonatomic, copy) NSString *createdAt;  //!< 创建时间
@property (nonatomic, copy) NSString *updatedAt;  //!< 修改时间
@property (nonatomic, copy) NSString *deletedAt;  //!< 在回收站时    删除时间

@property (nonatomic, assign) BOOL isFirst;  //!< 是否首帖
@property (nonatomic, assign) BOOL isComment;  //!< 是否是评论
@property (nonatomic, assign) NSInteger isApproved;  //!< 是否合法（0/1/2）(0 不合法 1 正常 2 忽略)

@property (nonatomic, assign) BOOL isLiked;  //!< 是否喜欢
@property (nonatomic, assign) BOOL isDeleted;  //!< 是否有权点赞

@property (nonatomic, assign) BOOL canEdit;  //!< 是否有权编辑
@property (nonatomic, assign) BOOL canApprove;  //!< 是否有权审核
@property (nonatomic, assign) BOOL canDelete;  //!< 是否有权永久删除
@property (nonatomic, assign) BOOL canHide;  //!< 是否有权放入回收站
@property (nonatomic, assign) BOOL canLike;  //!< 是否有权点赞


@end


@interface DZQDataPost: DZQSuperData


@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQPostModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQPostRelationModel *relationships;    //!< 属性注释

@end




