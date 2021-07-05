//
//  DZQCashV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

// 需要继承自 DZQSuperAttribute

@interface DZQCashV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *cash_id;  //!< 提现记录唯一编号 id
@property (nonatomic, copy) NSString *user_id;  //!< 提现用户id
@property (nonatomic, copy) NSString *cash_sn;  //!< 提现订单唯一编号



@property (nonatomic, assign) float cash_charge;  //!< 提现手续费
@property (nonatomic, assign) float cash_actual_amount;  //!< 用户到账金额
@property (nonatomic, assign) float cash_apply_amount;  //!< 用户提现申请金额
@property (nonatomic, assign) NSInteger cash_status;  //!< 提现状态，1：待审核，2：审核通过，3：审核不通过，4：待打款， 5，已打款， 6：打款失败

@property (nonatomic, copy) NSString *remark;  //!< 审核不通过原因或备注,默认为空
@property (nonatomic, copy) NSString *trade_no;  //!< 平台交易号
@property (nonatomic, copy) NSString *error_code;  //!< 提现交易错误代码，正常时为空
@property (nonatomic, copy) NSString *error_message;  //!< 提现错误信息，正常时为空

@property (nonatomic, assign) NSInteger refunds_status;  //!< 返款状态: 0 未返款，1 已返款

@property (nonatomic, copy) NSString *updated_at;  //!<
@property (nonatomic, copy) NSString *created_at;  //!<

@end


@interface DZQDataCash : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZQCashV1 *attributes;    //!< 属性注释
@property (nonatomic, strong) DZQCashRelationV1 *relationships;  //!< 属性注释


@end
