//
//  DZQQesAnswerV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQQesAnswerRelationV1.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQQesAnswerV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, copy) NSString *thread_id;  //!< 帖子ID
@property (nonatomic, copy) NSString *user_id;  //!< 帖子关联的posts表ID
@property (nonatomic, copy) NSString *be_user_id;  //!< 回答人的用户ID
@property (nonatomic, copy) NSString *content;  //!< 回答的内容
@property (nonatomic, copy) NSString *content_html;  //!< 回答的html 内容
@property (nonatomic, copy) NSString *ip;  //!< 回答人的IP
@property (nonatomic, assign) NSUInteger port;  //!< 回答人的端口
@property (nonatomic, assign) float price;  //!< 问答单价
@property (nonatomic, assign) float onlooker_unit_price;  //!< 围观单价
@property (nonatomic, assign) float onlooker_price;  //!< 围观总价格

@property (nonatomic, assign) NSUInteger onlooker_number;  //!< 围观总人数
@property (nonatomic, assign) BOOL is_onlooker;  //!< 是否允许围观 true允许 false不允许
@property (nonatomic, assign) BOOL is_answer;  //!< 是否已回答 0未回答 1已回答 2已过期
@property (nonatomic, assign) BOOL is_approved;  //!< 属性注释

@property (nonatomic, copy) NSString *created_at;  //!< 属性注释
@property (nonatomic, copy) NSString *updated_at;  //!< 属性注释
@property (nonatomic, copy) NSString *expired_at;  //!< 问答过期时间
@property (nonatomic, copy) NSString *answered_at;  //!< 属性注释

@end


@interface DZQDataQesAnswer : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQQesAnswerV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQQesAnswerRelationV1 *relationships;    //!< 属性注释

@end


NS_ASSUME_NONNULL_END
