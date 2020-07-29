//
//  DZMessageRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMessageRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 用户
@property (nonatomic, strong) DZQDataAttachment *attachment;  //!< 附件（图片)

@end

NS_ASSUME_NONNULL_END
