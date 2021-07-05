//
//  DZUserTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserTool.h"
#import "DZCashLogStyle.h"
#import "DZFollowCellStyle.h"

@implementation DZUserTool

+(NSArray<DZQDataFollow *>*)User_dataFollowResData:(DZQResV1 *)resModel{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyV1 *body in resModel.dataBody) {
        DZQDataFollow *threadModel = [[DZQDataFollow alloc] initWithResBody:body style:[DZFollowCellStyle class]];
        
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}


+(NSArray<DZQDataCashLog *>*)User_dataCashLogResData:(DZQResV1 *)resModel{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyV1 *body in resModel.dataBody) {
        DZQDataCashLog *threadModel = [[DZQDataCashLog alloc] initWithResBody:body style:[DZCashLogStyle class]];
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}


@end
