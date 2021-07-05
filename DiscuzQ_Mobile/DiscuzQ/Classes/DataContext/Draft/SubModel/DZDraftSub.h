//
//  DZDraftSub.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadDraftMCate : NSObject

//"type": "categories",
//"id": 6
@property (nonatomic, copy, readonly) NSString *type;  //!< 属性注释
@property (nonatomic, assign, readonly) NSInteger inner_id;  //!< 属性注释

+(instancetype)defaultCategory;
// 转换成 主题发送参数字典
-(NSDictionary *)cateModelToDictionary;

@end


@interface DZThreadDraftMAttach : NSObject

//"type": "attachments",
//"id": 6
@property (nonatomic, assign) NSInteger inner_id;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *type;  //!< 属性注释

// 转换成 主题发送参数字典
-(NSDictionary *)attachModelToDictionary;

@end



@interface DZThreadDraftMQues : NSObject

@property (nonatomic, copy) NSString *order_id;  //!< 支付成功后的 订单 id
@property (nonatomic, assign) NSUInteger be_user_id;  //!< 回答人的 用户 id
@property (nonatomic, assign) double price;  //!< 问答单价
@property (nonatomic, assign) BOOL is_onlooker;  //!< 是否允许围观 true允许 false不允许
@property (nonatomic, assign) NSInteger type;  //!< 0为面向所有人的悬赏帖，1为指定个人的问答帖
@property (nonatomic, copy) NSString *expired_at;  //!< 悬赏帖过期时间，当为所有人的悬赏帖时，这里是必填


// 转换成 主题发送参数字典
-(NSDictionary *)quesModelToDictionary;


@end










NS_ASSUME_NONNULL_END
