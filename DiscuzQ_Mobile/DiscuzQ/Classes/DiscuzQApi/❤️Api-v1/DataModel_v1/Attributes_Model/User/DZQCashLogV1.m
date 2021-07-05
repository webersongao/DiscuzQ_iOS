//
//  DZQCashLogV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQCashLogV1.h"


@implementation DZQCashLogV1

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"log_id":@"id"};
}

@end


@implementation DZQDataCashLog

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCashLogV1 class],
             @"relationships" : [DZQCashLogRelationV1 class]
    };
}


- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQCashLogV1 *)body.attributes;
        self.relationships = (DZQCashLogRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end
