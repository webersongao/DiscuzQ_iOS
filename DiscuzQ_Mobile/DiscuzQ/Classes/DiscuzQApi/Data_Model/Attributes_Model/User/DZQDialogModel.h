//
//  DZQDialogModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQDialogRelationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQDialogModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *dialog_message_id;  //!< 最新会话消息 ID
@property (nonatomic, copy) NSString *sender_user_id;  //!< 发送人 uid
@property (nonatomic, copy) NSString *recipient_user_id;  //!< 收信人 uid
@property (nonatomic, copy) NSString *sender_read_at;  //!< 发送人阅读时间,null 时未读
@property (nonatomic, copy) NSString *recipient_read_at;  //!< 收信人阅读时间,null 时未读
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间


@end


@interface DZQDataDialog : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQDialogModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQDialogRelationModel *relationships;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
