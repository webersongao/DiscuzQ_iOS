//
//  DZQDialogRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQMessageV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQDialogRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *sender;  //!< dialogMessage
@property (nonatomic, strong) DZQDataUser *recipient;  //!< 收信人
@property (nonatomic, strong) DZQDataMessage *dialogMessage;  //!< 最新消息

@end

NS_ASSUME_NONNULL_END
