//
//  DZQDialogRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQDialogRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *sender;  //!< dialogMessage
@property (nonatomic, strong) DZQDataUser *recipient;  //!< 收信人
@property (nonatomic, strong) DZQDataMessage *dialogMessage;  //!< 最新消息

@end

NS_ASSUME_NONNULL_END
