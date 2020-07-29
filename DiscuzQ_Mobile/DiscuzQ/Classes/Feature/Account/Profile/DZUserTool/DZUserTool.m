//
//  DZUserTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserTool.h"
#import "DZFollowCellStyle.h"

@implementation DZUserTool

+(NSArray<DZQDataFollow *>*)User_dataFollowResData:(DZQResModel *)resModel{
    
    NSMutableArray *threadArr = [NSMutableArray array];
    
    for (DZQBodyModel *body in resModel.dataBody) {
        DZQDataFollow *threadModel = [[DZQDataFollow alloc] init];
        threadModel.type = body.type;
        threadModel.type_id = body.type_id;
        threadModel.attributes = (DZQFollowModel *)body.attributes;
        threadModel.relationships = (DZQFollowRelationModel *)body.relationships;
        threadModel.styleModel = [[DZFollowCellStyle class] inner_dataStyle:threadModel];
        
        [threadArr addObject:threadModel];
    }
    
    return [threadArr copy];
}



@end
