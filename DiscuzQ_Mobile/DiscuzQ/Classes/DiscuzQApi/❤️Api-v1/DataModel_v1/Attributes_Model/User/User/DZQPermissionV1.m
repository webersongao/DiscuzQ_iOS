//
//  DZQPermissionV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQPermissionV1.h"

@implementation DZQPermissionV1

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"per_id":@"id"};
//}

@end



@implementation DZQDataPermission

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQPermissionV1 class]};
}


- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQPermissionV1 *)body.attributes;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end;
