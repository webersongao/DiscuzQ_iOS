//
//  DZQGroupRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQGroupRelationModel.h"

@implementation DZQGroupRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"permission" : [DZQPermissionModel class]};
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQGroupRelationModel *localModel = [DZQGroupRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}


@end
