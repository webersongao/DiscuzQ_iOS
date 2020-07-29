//
//  DZQDialogModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDialogModel.h"

@implementation DZQDialogModel


@end


@implementation DZQDataDialog

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQDialogModel class],
             @"relationships" : [DZQDialogRelationModel class]
    };
}



@end
