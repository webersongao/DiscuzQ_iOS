//
//  DZQGroupV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQGroupV1.h"


@implementation DZQGroupV1

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"isDefault":@"default"};
}

@end



@implementation DZQDataGroup

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQGroupV1 class],
             @"relationships" : [DZQGroupRelationV1 class]};
}


- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQGroupV1 *)body.attributes;
        self.relationships = (DZQGroupRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end;
