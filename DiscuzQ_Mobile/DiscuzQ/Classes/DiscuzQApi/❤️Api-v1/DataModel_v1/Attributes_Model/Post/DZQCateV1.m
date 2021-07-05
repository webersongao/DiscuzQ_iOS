//
//  DZQCateV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/14.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCateV1.h"

@implementation DZQCateV1


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id",
             @"cate_description":@"description"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"children" : [DZQCateV1 class]};
}

@end

@implementation DZQDataCate

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCateV1 class]};
}

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQCateV1 *)body.attributes;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end
