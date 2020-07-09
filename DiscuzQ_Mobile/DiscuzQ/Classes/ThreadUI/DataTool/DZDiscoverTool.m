//
//  DZDiscoverTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDiscoverTool.h"

@implementation DZDiscoverTool

+(NSArray<DZQDataThread *>*)thead_dataThreadResData:(DZQResModel *)resModel style:(Class)styleCls{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyModel *body in resModel.dataBody) {
        DZQDataThread *threadModel = [[DZQDataThread alloc] init];
        threadModel.type = body.type;
        threadModel.type_id = body.type_id;
        threadModel.attributes = (DZQThreadModel *)body.attributes;
        threadModel.relationships = (DZQThreadRelationModel *)body.relationships;
        threadModel.styleModel = [styleCls inner_dataStyle:threadModel];
        
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}


/// 处理 返回的主题评论数据
+(NSArray<DZQDataPost *>*)post_dataPostResData:(DZQResModel *)resModel style:(Class)styleCls{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyModel *body in resModel.dataBody) {
        DZQDataPost *threadModel = [[DZQDataPost alloc] init];
        threadModel.type = body.type;
        threadModel.type_id = body.type_id;
        threadModel.attributes = (DZQPostModel *)body.attributes;
        threadModel.relationships = (DZQPostRelationModel *)body.relationships;
        threadModel.styleModel = [styleCls inner_dataStyle:threadModel];
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}



@end
