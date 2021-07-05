//
//  DZCashLogStyle.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZCashLogStyle : DZQStyle

@property(nonatomic,assign) CGRect kf_cashlog_type;
@property(nonatomic,assign) CGRect kf_cashlog_available;
@property(nonatomic,assign) CGRect kf_cashlog_freeze;
@property(nonatomic,assign) CGRect kf_cashlog_availableDesc;
@property(nonatomic,assign) CGRect kf_cashlog_time;
@property(nonatomic,assign) CGRect kf_cashlog_orderSn;


@property (nonatomic, copy) NSString *localChange_Type;  //!< 变动类型

// 计算 用户 内容 frame
+(instancetype)DCashLogCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataCashLog *)dataModel;



@end

NS_ASSUME_NONNULL_END
