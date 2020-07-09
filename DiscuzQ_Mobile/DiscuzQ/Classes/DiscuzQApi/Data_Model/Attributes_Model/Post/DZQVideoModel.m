//
//  DZQVideoModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQVideoModel.h"

@implementation DZQVideoModel

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"video_id":@"id"};
//}

@end


@implementation DZQDataVideo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQVideoModel class]};
}

@end
