//
//  DZMessageRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMessageRelationModel.h"

@implementation DZMessageRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sender" : [DZQDataUser class],
             @"recipient" : [DZQDataUser class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZMessageRelationModel *localModel = [DZMessageRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}

@end
