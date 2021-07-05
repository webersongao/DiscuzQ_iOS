//
//  DZQUserV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQUserV1.h"

@implementation DZQUnReadV1


@end

@implementation DZQUserV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"typeUnreadNotifications" : [DZQUnReadV1 class]};
}

@end

@implementation DZQDataLoginUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQUserV1 class]};
}

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQUserV1 *)body.attributes;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end
