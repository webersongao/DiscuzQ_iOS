//
//  DZQLoginRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQLoginRelationModel.h"

@implementation DZQLoginRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"users" : [DZQDataLoginUser class]};
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQLoginRelationModel *localModel = [DZQLoginRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end
