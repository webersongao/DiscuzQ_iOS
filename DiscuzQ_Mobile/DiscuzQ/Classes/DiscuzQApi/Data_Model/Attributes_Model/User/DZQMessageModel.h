//
//  DZQMessageModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZMessageRelationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQMessageModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;  //!< 发送人 uid
@property (nonatomic, copy) NSString *dialog_id;  //!< 会话 id
@property (nonatomic, copy) NSString *attachment_id;  //!< 附件id
@property (nonatomic, copy) NSString *summary;  //!< 消息内容 摘要
@property (nonatomic, copy) NSString *message_text;  //!< 消息内容
@property (nonatomic, copy) NSString *message_text_html;  //!< 消息内容 Html
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间

@end


@interface DZQDataMessage : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQMessageModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZMessageRelationModel *relationships;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
