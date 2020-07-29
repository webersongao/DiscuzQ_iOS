//
//  DZQTopicRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTopicRelationModel.h"

@implementation DZQTopicRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"lastThread" : [DZQDataThread class]
    };
}



+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQTopicRelationModel *localModel = [DZQTopicRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}

@end
