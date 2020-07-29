//
//  DZQUserRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQUserRelationModel.h"

@implementation DZQUserRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"groups" : [DZQDataGroup class]};
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQUserRelationModel *localModel = [DZQUserRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}

@end
