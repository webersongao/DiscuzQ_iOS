//
//  NSObject+DZQModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "NSObject+DZQModel.h"
#import <YYModel.h>

@implementation NSObject (DZQModel)

+ (nullable instancetype)DZQ_ModelWithJSON:(id)json{
    return [self yy_modelWithJSON:json];
}

+ (nullable instancetype)DZQ_ModelWithDictionary:(NSDictionary *)dictionary{
    return [self yy_modelWithDictionary:dictionary];
}

- (BOOL)DZQ_ModelSetWithJSON:(id)json{
    return [self yy_modelSetWithJSON:json];
}

- (BOOL)DZQ_ModelSetWithDictionary:(NSDictionary *)dictionary{
    return [self yy_modelSetWithDictionary:dictionary];
}

- (nullable id)DZQ_ModelToJSONObject{
    return [self yy_modelToJSONObject];
}

- (nullable NSData *)DZQ_ModelToJSONData{
    return [self yy_modelToJSONData];
}

- (nullable NSString *)DZQ_ModelToJSONString{
    return [self yy_modelToJSONString];
}

- (nullable id)DZQ_ModelCopy{
    return [self yy_modelCopy];
}

- (NSUInteger)DZQ_ModelHash{
    return [self yy_modelHash];
}

- (BOOL)DZQ_ModelIsEqual:(id)model{
    return [self yy_modelIsEqual:model];
}

- (NSString *)DZQ_ModelDescription{
    return [NSString stringWithFormat:@"DZQModel Description : %@",[self yy_modelDescription]];
}

- (void)DZQ_ModelEncodeWithCoder:(NSCoder *)aCoder{
    [self yy_modelEncodeWithCoder:aCoder];
}

- (id)DZQ_ModelInitWithCoder:(NSCoder *)aDecoder{
    return [self yy_modelInitWithCoder:aDecoder];
}

@end


@implementation NSArray (DZQModel)

+ (nullable NSArray *)DZQ_ModelArrayWithClass:(Class)cls json:(id)json{
    
    return [self yy_modelArrayWithClass:cls json:json];
}

@end

@implementation NSDictionary (DZQModel)

+ (nullable NSDictionary *)DZQ_ModelDictionaryWithClass:(Class)cls json:(id)json{
    
    return [self yy_modelDictionaryWithClass:cls json:json];
}


@end



