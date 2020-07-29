//
//  DZQOrderRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQOrderRelationModel.h"

@implementation DZQOrderRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"payee" : [DZQDataUser class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQOrderRelationModel *localModel = [DZQOrderRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
}

@end
