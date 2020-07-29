//
//  DZQCashLogModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQCashLogRelationModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQCashLogModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *log_id;  //!< 提现记录唯一编号 id
@property (nonatomic, assign) float change_available_amount;  //!< 变动可用金额
@property (nonatomic, assign) float change_freeze_amount;  //!< 变动冻结金额
@property (nonatomic, assign) NSInteger change_type;  //!< 变动类型 10 提现冻结，11 提现成功，12 提现解冻，30 注册收入，31 打赏收入，32 人工收入，50 人工支出
@property (nonatomic, copy) NSString *title;  //!< 变动标题
@property (nonatomic, copy) NSString *change_desc;  //!< 变动描述
@property (nonatomic, copy) NSString *updated_at;  //!< 更新时间
@property (nonatomic, copy) NSString *created_at;  //!< 创建时间


@end


@interface DZQDataCashLog : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQCashLogModel *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQCashLogRelationModel *relationships;  //!< 属性注释

@end
