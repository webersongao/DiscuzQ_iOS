//
//  DZQMessageV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZMessageRelationV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQMessageV1 : DZQSuperAttribute

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
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQMessageV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZMessageRelationV1 *relationships;  //!< 属性注释


@end

NS_ASSUME_NONNULL_END
