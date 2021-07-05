//
//  DZQBaseUserV3.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQBaseUserV3 : DZQBodyV3

@property (nonatomic, copy) NSString *userId;  //!< 属性注释
@property (nonatomic, copy) NSString *nickname;  //!< 属性注释
@property (nonatomic, copy) NSString *avatar;  //!< 属性注释

@property (nonatomic, assign) NSInteger followCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger fansCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger likedCount;  //!< 属性注释
@property (nonatomic, assign) NSInteger questionCount;  //!< 属性注释
@property (nonatomic, assign) BOOL isRealName;  //!< 属性注释
@property (nonatomic, copy) NSString *joinedAt;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
