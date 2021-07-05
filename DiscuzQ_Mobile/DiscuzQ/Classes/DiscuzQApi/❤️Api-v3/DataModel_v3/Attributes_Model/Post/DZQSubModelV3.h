//
//  DZQSubModelV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQGroupV3 : DZQBodyV3

@end

@interface DZQRewardV3 : DZQBodyV3

@property (nonatomic, strong) NSArray *users;  //!< 属性注释
@property (nonatomic, assign) NSInteger postCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger shareCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger likePayCount;  //!< 属性注释

@end

@interface DZQDisplayTagV3 : DZQBodyV3

@property (nonatomic, assign) BOOL isPrice;  //!< 属性注释
@property (nonatomic, assign) BOOL isEssence;  //!< 属性注释
@property (nonatomic, assign) BOOL isRedPack;  //!< 属性注释
@property (nonatomic, assign) BOOL isReward;  //!< 属性注释



@end


@interface DZQPositionV3 : DZQBodyV3

@property (nonatomic, copy) NSString *longitude;  //!< 属性注释
@property (nonatomic, copy) NSString *latitude;  //!< 属性注释
@property (nonatomic, copy) NSString *address;  //!< 属性注释
@property (nonatomic, copy) NSString *location;  //!< 属性注释

@end


@interface DZQAbilityV3 : DZQBodyV3

@property (nonatomic, assign) BOOL canEdit;  //!< 属性注释
@property (nonatomic, assign) BOOL canDelete;  //!< 属性注释
@property (nonatomic, assign) BOOL canEssence;  //!< 属性注释
@property (nonatomic, assign) BOOL canStick;  //!< 属性注释
@property (nonatomic, assign) BOOL canReply;  //!< 属性注释
@property (nonatomic, assign) BOOL canViewPost;  //!< 属性注释
@property (nonatomic, assign) BOOL canBeReward;  //!< 属性注释
@property (nonatomic, assign) BOOL canFreeViewPost;  //!< 属性注释

@end



@interface DZQContentV3 : DZQBodyV3

@property (nonatomic, copy) NSString *text;  //!< 属性注释
@property (nonatomic, strong) NSArray *indexes;  //!< 属性注释

@end



NS_ASSUME_NONNULL_END
