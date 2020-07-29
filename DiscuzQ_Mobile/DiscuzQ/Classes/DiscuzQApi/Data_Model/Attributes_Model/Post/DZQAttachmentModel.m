//
//  DZQAttachmentModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQAttachmentModel.h"

@implementation DZQAttachmentModel

@end


@implementation DZQDataAttachment

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQAttachmentModel class]};
}

@end
