//
//  DZCashLogStyle.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZCashLogStyle.h"

@implementation DZCashLogStyle

+(DZCashLogStyle *)inner_dataStyle:(DZQDataCashLog *)dataModel{
    
    [self formartPostContentString:dataModel];
    
    return [self canculatePostContentStyle:dataModel];
    
}

+ (void)formartPostContentString:(DZQDataCashLog *)dataModel{
    
    dataModel.attributes.created_at = [dataModel.attributes.created_at dateFormatWithAccurate:unAccurate];
    dataModel.attributes.updated_at = [dataModel.attributes.updated_at dateFormatWithAccurate:unAccurate];
    
}

// 计算 空间高度 宽度等
+ (instancetype)canculatePostContentStyle:(DZQDataCashLog *)dataModel{
    
    DZCashLogStyle *cellStyle = [self DCashLogCellStyle:dz_CellWidth maxWidth:dz_CellMaxContentWidth dataModel:dataModel];
    
    
    return cellStyle;
}

// 计算 用户 内容 frame
+(instancetype)DCashLogCellStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataCashLog *)dataModel{
    
    DZCashLogStyle *style = [[DZCashLogStyle alloc] init];
    
    [self.class formartCashLogStyle:style dataModel:dataModel];
    
    style.kf_cashlog_type = CGRectMake(kMargin15, kMargin10, kMargin40, kMargin40);
    style.kf_cashlog_available = CGRectMake(CGRectGetMaxX(style.kf_cashlog_type) + kMargin15, kMargin10, (contenMaxWidth-CGRectGetMaxX(style.kf_cashlog_type))/2.0, kMargin20);
    style.kf_cashlog_freeze = CGRectMake(0, 0, 0, 0);
    
    
    style.kf_cashlog_availableDesc = CGRectMake(CGRectGetMaxX(style.kf_cashlog_type) + kMargin15, CGRectGetMaxY(style.kf_cashlog_type)-13, (contenMaxWidth-CGRectGetMaxX(style.kf_cashlog_type))/2.0, 13);
    
    // ⚠️理论上存在 kf_cashlog_orderSn 和 kf_cashlog_availableDesc遮挡的情况,暂时不处理
    style.kf_cashlog_time = CGRectMake(CGRectGetMaxX(style.kf_cashlog_freeze) + kMargin5, kMargin10, cellWidth-kMargin50-(CGRectGetMaxX(style.kf_cashlog_freeze)), 13);
    style.kf_cashlog_orderSn = CGRectMake(kMargin15, CGRectGetMidY(style.kf_cashlog_availableDesc), contenMaxWidth-kMargin30, 13);
    
    return style;
}




+ (void)formartCashLogStyle:(DZCashLogStyle *)style dataModel:(DZQDataCashLog *)dataModel{
    
    NSString *localChange = @"";
    if (dataModel.attributes.change_type == 10) {
        localChange = @"提现冻结";
    }else if (dataModel.attributes.change_type == 11){
        localChange = @"提现成功";
    }else if (dataModel.attributes.change_type == 12){
        localChange = @"提现解冻";
    }else if (dataModel.attributes.change_type == 30){
        localChange = @"注册收入";
    }else if (dataModel.attributes.change_type == 31){
        localChange = @"打赏收入";
    }else if (dataModel.attributes.change_type == 32){
        localChange = @"人工收入";
    }else if (dataModel.attributes.change_type == 50){
        localChange = @"人工支出";
    }
    style.localChange_Type = localChange;
    
}





@end
