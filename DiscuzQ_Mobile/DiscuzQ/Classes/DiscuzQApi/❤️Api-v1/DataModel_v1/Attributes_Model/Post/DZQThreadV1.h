//
//  DZQThreadV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@class DZQGratuityV1;
@class DZQThreadRelationV1;

// 需要继承自 DZQSuperAttribute
@interface DZQThreadV1 : DZQSuperAttribute

@property (nonatomic, assign) NSInteger type;  //!< 文章类型(0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖)

@property (nonatomic, copy) NSString *title;  //!< 长文主题 de 标题
@property (nonatomic, assign) float price;  //!< 价格
@property (nonatomic, assign) float attachmentPrice;  //!< 附件价格

@property (nonatomic, assign) NSInteger freeWords;  //!< 付费主题可免费阅读字数百分比(使用小数)
@property (nonatomic, assign) NSInteger viewCount;  //!< 查看数
@property (nonatomic, assign) NSInteger postCount;  //!< 帖子数
@property (nonatomic, assign) NSInteger paidCount;  //!< 付费数
@property (nonatomic, assign) NSInteger rewardedCount;  //!< 打赏数
@property (nonatomic, assign) double longitude;  //!< 经度
@property (nonatomic, assign) double latitude;  //!< 纬度
@property (nonatomic, copy) NSString *address;  //!< 经纬度坐标对应的地址（如：广东省深圳市深南大道 10000 号）
@property (nonatomic, copy) NSString *location;  //!< 经纬度坐标对应的位置（如：腾讯大厦）

@property (nonatomic, copy) NSString *createdAt;  //!< 创建时间
@property (nonatomic, copy) NSString *updatedAt;  //!< 修改时间
@property (nonatomic, copy) NSString *deletedAt;  //!< 在回收站时    删除时间

@property (nonatomic, assign) NSInteger isApproved;  //!< 是否合法（0/1/2）(0 不合法 1 正常 2 忽略)

@property (nonatomic, assign) BOOL isSticky;  //!< 是否置顶
@property (nonatomic, assign) BOOL isEssence;  //!< 是否加精
@property (nonatomic, assign) BOOL isSite;  //!< 属性注释
@property (nonatomic, assign) BOOL isAnonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL isDraft;  //!< 是否草稿箱
@property (nonatomic, assign) BOOL canBeReward;  //!< 属性注释
@property (nonatomic, assign) BOOL canViewPosts;  //!< 是否有权查看详情
@property (nonatomic, assign) BOOL canReply;  //!< 是否有权回复
@property (nonatomic, assign) BOOL canApprove;  //!< 是否有权审核
@property (nonatomic, assign) BOOL canSticky;  //!< 是否有权置顶
@property (nonatomic, assign) BOOL canEssence;  //!< 是否有权加精
@property (nonatomic, assign) BOOL canDelete;  //!< 是否有权永久删除
@property (nonatomic, assign) BOOL canHide;  //!< 是否有权放入回收站
@property (nonatomic, assign) BOOL canEdit;  //!< 是否有权 编辑
@property (nonatomic, assign) BOOL isRedPacket;  //!< 是否为红包帖，0不是，1是
@property (nonatomic, strong) DZQRedPacketV1 * redPacket;  //!< 该帖关联的红包信息
@property (nonatomic, copy) NSString *postContent;  //!<
@property (nonatomic, strong) DZQGratuityV1 * questionTypeAndMoney;  //!< 悬赏/问答帖相关内容

@property (nonatomic, assign) BOOL isDeleted;  //!<
@property (nonatomic, assign) BOOL onlookerState;  //!< 是否是围观状态
@property (nonatomic, assign) BOOL canFavorite;  //!< 是否有权收藏
@property (nonatomic, assign) BOOL isFavorite;  //!< 是否收藏


@end


@interface DZQDataThread: DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQThreadV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQThreadRelationV1 *relationships;    //!< 属性注释


@end
