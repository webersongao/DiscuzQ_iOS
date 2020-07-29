//
//  DZQDialogRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDialogRelationModel.h"

@implementation DZQDialogRelationModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sender" : [DZQDataUser class],
             @"recipient" : [DZQDataUser class],
             @"dialogMessage" : [DZQDataMessage class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQDialogRelationModel *localModel = [DZQDialogRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}



@end
