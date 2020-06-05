//
//  DZQProfileRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQProfileRelationModel.h"

@implementation DZQProfileRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"groups" : [DZQDataGroup class]};
}


+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQProfileRelationModel *localModel = [DZQProfileRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end
