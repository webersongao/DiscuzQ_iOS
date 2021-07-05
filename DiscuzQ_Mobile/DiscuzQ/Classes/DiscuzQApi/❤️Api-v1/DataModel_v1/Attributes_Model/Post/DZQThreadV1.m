//
//  DZQThreadV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadV1.h"
#import "DZQThreadRelationV1.h"

@implementation DZQThreadV1
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"redPacket" : [DZQRedPacketV1 class],
             @"questionTypeAndMoney" : [DZQGratuityV1 class]
    };
}

@end


@implementation DZQDataThread

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQThreadV1 class],
             @"relationships" : [DZQThreadRelationV1 class]
    };
}

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQThreadV1 *)body.attributes;
        self.relationships = (DZQThreadRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end
