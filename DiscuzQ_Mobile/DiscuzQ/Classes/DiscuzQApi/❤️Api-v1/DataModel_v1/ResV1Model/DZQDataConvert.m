//
//  DZQDataConvert.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataConvert.h"

@implementation DZQDataConvert

-(void)convertResponseDataBody:(NSArray<DZQBodyV1 *> *)dataBody{
    
    [self handleFrameBodyArray:dataBody];
    
}

- (BOOL)handleFrameBodyArray:(NSArray<DZQBodyV1 *> *)attributes
{
    BOOL handleRes = YES;
    
    for (DZQBodyV1 *body in attributes) {
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
