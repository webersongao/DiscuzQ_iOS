//
//  DZQGroupModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQGroupModel.h"


@implementation DZQGroupModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"isDefault":@"default"};
}

@end



@implementation DZQDataGroup

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQGroupModel class]};
}

@end;
