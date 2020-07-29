//
//  DZQBaseModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseModel.h"


@implementation DZQDataIdModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

@end

@implementation DZQDataModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

@end


@implementation DZQLinkModel

@end

@implementation DZQMetaModel

@end


@implementation DZQErrtailModel

@end

@implementation DZQErrorModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"detail" : [DZQErrtailModel class]};
}

@end
