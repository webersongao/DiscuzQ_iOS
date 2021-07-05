//
//  DZQThreadV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV3.h"
#import "DZQUserV3.h"
#import "DZQSubModelV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQThreadV3 : DZQBodyV3

@property (nonatomic, copy) NSString *threadId;  //!< 属性注释
@property (nonatomic, copy) NSString *postId;  //!< 属性注释
@property (nonatomic, copy) NSString *userId;  //!< 属性注释
@property (nonatomic, copy) NSString *categoryId;  //!< 属性注释
@property (nonatomic, copy) NSString *topicId;  //!< 属性注释
@property (nonatomic, copy) NSString *categoryName;  //!< 属性注释
@property (nonatomic, copy) NSString *title;  //!< 属性注释
@property (nonatomic, assign) BOOL isApproved;  //!< 属性注释
@property (nonatomic, assign) NSInteger viewCount;  //!< 属性注释
@property (nonatomic, assign) BOOL isStick;  //!< 属性注释
@property (nonatomic, assign) BOOL isDraft;  //!< 属性注释
@property (nonatomic, assign) BOOL isAnonymous;  //!< 属性注释
@property (nonatomic, assign) BOOL isFavorite;  //!< 属性注释
@property (nonatomic, assign) double price;  //!< 属性注释
@property (nonatomic, assign) double attachmentPrice;  //!< 属性注释
@property (nonatomic, assign) NSInteger payType;  //!< 属性注释

@property (nonatomic, copy) NSString *paid;  //!< 属性注释
@property (nonatomic, assign) BOOL isLike;  //!< 属性注释
@property (nonatomic, assign) BOOL isReward;  //!< 属性注释

@property (nonatomic, copy) NSString *createdAt;  //!< 属性注释
@property (nonatomic, copy) NSString *updatedAt;  //!< 属性注释
@property (nonatomic, copy) NSString *diffTime;  //!< 属性注释

@property (nonatomic, strong) DZQBaseUserV3 *user;  //!< 属性注释
@property (nonatomic, strong) DZQGroupV3 *group;  //!< 属性注释
@property (nonatomic, strong) DZQRewardV3 *likeReward;  //!< 属性注释
@property (nonatomic, strong) DZQDisplayTagV3 *displayTag;  //!< 属性注释
@property (nonatomic, strong) DZQPositionV3 *position;  //!< 属性注释
@property (nonatomic, strong) DZQAbilityV3 *ability;  //!< 属性注释
@property (nonatomic, strong) DZQContentV3 *content;  //!< 属性注释
@property (nonatomic, assign) NSInteger freewords;  //!< 属性注释
@property (nonatomic, strong) NSArray *orderInfo;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
