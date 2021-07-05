//
//  DZQFollowRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQFollowRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *toUser;  //!<  关注用户，配合 type=1 使用
@property (nonatomic, strong) DZQDataUser *fromUser;  //!<  粉丝用户，配合 type=2 使用

@end

NS_ASSUME_NONNULL_END
