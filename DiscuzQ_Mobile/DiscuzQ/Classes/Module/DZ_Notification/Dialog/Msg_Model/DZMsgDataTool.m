//
//  DZMsgDataTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMsgDataTool.h"
#import "DZDiaLogStyle.h"

@implementation DZMsgDataTool

+(NSArray<DZQDataNoti *>*)dialogResData:(NSArray <DZQBodyV1 *> *)NotiDataBody{
    
    NSMutableArray *notiDataArray = [NSMutableArray array];
    
    for (DZQBodyV1 *body in NotiDataBody) {
        DZQDataDialog *daDialog = [[DZQDataDialog alloc] initWithResBody:body style:[DZDiaLogStyle class]];
        [notiDataArray addObject:daDialog];
    }
    
    return [notiDataArray copy];
}



@end
