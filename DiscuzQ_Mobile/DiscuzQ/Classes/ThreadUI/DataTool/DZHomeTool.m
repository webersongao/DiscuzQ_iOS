//
//  DZHomeTool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHomeTool.h"

@implementation DZHomeTool

+(NSArray<DZQDataThread *>*)thead_dataThreadResData:(DZQResV1 *)resModel style:(Class)styleCls{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyV1 *body in resModel.dataBody) {
        DZQDataThread *threadModel = [[DZQDataThread alloc] initWithResBody:body style:styleCls];
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}


/// 处理 返回的主题评论数据
+(NSArray<DZQDataPost *>*)post_dataPostResData:(DZQResV1 *)resModel style:(Class)styleCls{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyV1 *body in resModel.dataBody) {
        DZQDataPost *threadModel = [[DZQDataPost alloc] initWithResBody:body style:styleCls];
        
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}

+(DZQDataThread *)thead_shareDataThreadResData:(DZQResV1 *)resModel style:(Class)styleCls{
    
    DZQBodyV1 *body = resModel.dataBody.firstObject;
    
    DZQDataThread *threadModel = [[DZQDataThread alloc] initWithResBody:body style:nil];
    
    return threadModel;
}

@end
