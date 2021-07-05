//
//  DZQVideoV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQVideoV1.h"

@implementation DZQVideoV1

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"video_id":@"id"};
//}

@end


@implementation DZQDataVideo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQVideoV1 class]};
}



- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQVideoV1 *)body.attributes;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}


@end
