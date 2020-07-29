//
//  DZQDataConvert.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataConvert.h"
#import "DZQResModel.h"

@implementation DZQDataConvert


-(void)convertResponseDataBody:(NSArray<DZQBodyModel *> *)dataBody{
    
    [self handleFrameBodyArray:dataBody];
    
}

- (BOOL)handleFrameBodyArray:(NSArray<DZQBodyModel *> *)attributes
{
    BOOL handleRes = YES;
    
    for (DZQBodyModel *body in attributes) {
       handleRes = [self handleDataAttribute:body.attributes relationship:body.relationships];
    }
    
    return handleRes;
}

// 子类继承 用来创建布局对象
- (BOOL)handleDataAttribute:(DZQSuperAttribute *)attribute relationship:(DZQSuperRelation *)relationship
{
    
    return YES;
}




@end
