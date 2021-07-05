//
//  DZQFollowV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQFollowV1.h"

@implementation DZQFollowV1

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"follow_id":@"id"};
}

@end



@implementation DZQDataFollow

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQFollowV1 class],
             @"relationships" : [DZQFollowRelationV1 class]
    };
}


- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQFollowV1 *)body.attributes;
        self.relationships = (DZQFollowRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}



@end
