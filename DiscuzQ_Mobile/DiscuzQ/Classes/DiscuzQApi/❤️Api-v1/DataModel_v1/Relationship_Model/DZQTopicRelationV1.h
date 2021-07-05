//
//  DZQTopicRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQTopicRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 话题创建人
@property (nonatomic, strong) DZQDataThread *lastThread;  //!< 最新主题


@end

NS_ASSUME_NONNULL_END
