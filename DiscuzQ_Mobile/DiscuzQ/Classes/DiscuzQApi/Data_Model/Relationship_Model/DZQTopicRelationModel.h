//
//  DZQTopicRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQTopicRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 话题创建人
@property (nonatomic, strong) DZQDataThread *lastThread;  //!< 最新主题


@end

NS_ASSUME_NONNULL_END
