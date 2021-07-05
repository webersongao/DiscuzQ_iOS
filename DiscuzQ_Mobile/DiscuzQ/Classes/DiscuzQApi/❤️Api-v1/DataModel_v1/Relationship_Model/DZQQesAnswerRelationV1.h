//
//  DZQQesAnswerRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQQesAnswerRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *beUser;  //!< 被提问人用户信息
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *images;  //!< 回答的图片内容

@end

NS_ASSUME_NONNULL_END
