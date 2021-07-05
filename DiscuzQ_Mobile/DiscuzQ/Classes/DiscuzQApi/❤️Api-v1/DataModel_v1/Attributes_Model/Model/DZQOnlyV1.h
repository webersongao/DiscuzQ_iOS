//
//  DZQOnlyV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 红包贴 相关内容
@interface DZQRedPacketV1 : NSObject

@property (nonatomic, copy) NSString *inner_id;  //!< 红包ID
@property (nonatomic, copy) NSString *thread_id;  //!< 关联的threads主键ID
@property (nonatomic, copy) NSString *post_id;  //!< 关联的posts主键ID

@property (nonatomic, assign) NSInteger rule;  //!< 发放规则，0定额，1随机
@property (nonatomic, assign) NSInteger condition;  //!< 领取红包条件，0回复，1集赞
@property (nonatomic, assign) NSInteger likenum;  //!< 若红包领取条件为集赞，必填集赞数
@property (nonatomic, assign) float money;  //!< 红包总金额
@property (nonatomic, assign) NSInteger number;  //!< 红包个数
@property (nonatomic, assign) float remain_money;  //!< 剩余红包总额
@property (nonatomic, assign) NSInteger remain_number;  //!< 剩余红包个数
@property (nonatomic, assign) NSInteger status;  //!< 0:红包已过期,1:红包未过期，2:红包已领完，3:红包已退还，4:不处理的异常红包
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间

@end


NS_ASSUME_NONNULL_END
