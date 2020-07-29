//
//  DZQCateModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/14.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCateModel.h"

@implementation DZQCateModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"cate_desc":@"description"};
}

@end

@implementation DZQDataCate

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCateModel class]};
}

@end
