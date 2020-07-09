//
//  DZQThreadModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@class DZQThreadRelationModel;
// 需要继承自 DZQSuperAttribute
@interface DZQThreadModel : DZQSuperAttribute

@property (nonatomic, assign) NSInteger type;  //!< 文章类型(0 普通 1 长文 2 视频 3 图片)

@property (nonatomic, copy) NSString *title;  //!< 长文主题 de 标题
@property (nonatomic, assign) float price;  //!< 长文主题 de  主题价格

@property (nonatomic, assign) NSInteger viewCount;  //!< 查看数
@property (nonatomic, assign) NSInteger postCount;  //!< 帖子数
@property (nonatomic, assign) NSInteger paidCount;  //!< 付费数
@property (nonatomic, assign) NSInteger rewardedCount;  //!< 打赏数

@property (nonatomic, copy) NSString *createdAt;  //!< 创建时间
@property (nonatomic, copy) NSString *updatedAt;  //!< 修改时间
@property (nonatomic, copy) NSString *deletedAt;  //!< 在回收站时    删除时间

@property (nonatomic, assign) NSInteger isApproved;  //!< 是否合法（0/1/2）(0 不合法 1 正常 2 忽略)

@property (nonatomic, assign) BOOL isSticky;  //!< 是否置顶
@property (nonatomic, assign) BOOL isEssence;  //!< 是否加精
@property (nonatomic, assign) BOOL isFavorite;  //!< 是否收藏
@property (nonatomic, assign) BOOL paid;  //!< 是否付费

@property (nonatomic, assign) BOOL canViewPosts;  //!< 是否有权查看详情
@property (nonatomic, assign) BOOL canReply;  //!< 是否有权回复
@property (nonatomic, assign) BOOL canApprove;  //!< 是否有权审核
@property (nonatomic, assign) BOOL canSticky;  //!< 是否有权置顶
@property (nonatomic, assign) BOOL canEssence;  //!< 是否有权加精
@property (nonatomic, assign) BOOL canDelete;  //!< 是否有权永久删除
@property (nonatomic, assign) BOOL canHide;  //!< 是否有权放入回收站
@property (nonatomic, assign) BOOL canFavorite;  //!< 是否有权收藏


@end


@interface DZQDataThread: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQThreadModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQThreadRelationModel *relationships;    //!< 属性注释


@end
