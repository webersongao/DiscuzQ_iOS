//
//  DZThreadProperty.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadProperty.h"

@implementation DZThreadTypeModel

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"typeId" : @"typeid",
    };
}

-(void)setName:(NSString *)name{
    _name = [name flattenHTMLTrimWhiteSpace:NO];
}

@end

@implementation DZThreadPermModel

@end


@implementation DZThreadTypesModel

//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"types" : [DZThreadTypeModel class]
//    };
//}

@end

@implementation DZActivitySetModel

@end

