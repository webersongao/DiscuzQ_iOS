//
//  DZQGratuityRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQGratuityRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *beUser;  //!< 用户
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *images;  //!< 用户

@end

NS_ASSUME_NONNULL_END
