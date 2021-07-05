//
//  DZQGratuityV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
///  悬赏问答（每个人都可以回答的那种悬赏 问答）

#import "DZQGratuityV1.h"
#import "DZQGratuityRelationV1.h"

@implementation DZQGratuityV1

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}


@end


@implementation DZQDataGratuity

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQGratuityV1 class],
             @"relationships" : [DZQGratuityRelationV1 class]
    };
}

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQGratuityV1 *)body.attributes;
        self.relationships = (DZQGratuityRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end


