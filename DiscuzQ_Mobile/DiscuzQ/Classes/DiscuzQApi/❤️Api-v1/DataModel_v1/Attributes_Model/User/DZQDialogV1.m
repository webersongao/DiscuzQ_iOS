//
//  DZQDialogV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDialogV1.h"

@implementation DZQDialogV1


@end


@implementation DZQDataDialog

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQDialogV1 class],
             @"relationships" : [DZQDialogRelationV1 class]
    };
}

- (instancetype)initWithResBody:(DZQBodyV1 *)body style:(Class)styleCls{
    self = [super initWithResBody:body style:styleCls];
    if (self) {
        self.type = body.type;
        self.inner_id = body.inner_id;
        self.attributes = (DZQDialogV1 *)body.attributes;
        self.relationships = (DZQDialogRelationV1 *)body.relationships;
        self.styleModel = styleCls ? [styleCls inner_dataStyle:self] : nil;
    }
    return self;
}



@end
