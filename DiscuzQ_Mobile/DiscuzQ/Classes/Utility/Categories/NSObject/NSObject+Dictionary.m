//
//  NSObject+Dictionary.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "NSObject+Dictionary.h"

@implementation NSObject (Dictionary)


- (NSDictionary *)DZQ_ModelToDictionary {

    if ([self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    return [self dicFromObject:self];
}

- (NSArray<NSDictionary *> *)DZQ_ModelToDictionaryArray {
    
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray *mutabArr = [[NSMutableArray alloc] initWithCapacity:2];
    for (NSObject *innerObj in (NSArray *)self) {
        NSDictionary *innerDict = [self dicFromObject:innerObj];
        if (innerDict) {
            [mutabArr addObject:innerDict];
        }
    }
    
    return mutabArr.copy;
}

- (NSDictionary *)dicFromObject:(NSObject *)object {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithUTF8String:cName];
        NSObject *value = [object valueForKey:name];//valueForKey返回的数字和字符串都是对象
        
        if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            //string , bool, int ,NSinteger
            [dic setObject:value forKey:name];
            
        } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
            //字典或字典
            [dic setObject:[self arrayOrDicWithObject:(NSArray*)value] forKey:name];
            
        } else if (value == nil) {
            //null
            NSLog(@"");
            // [dic setObject:[NSNull null] forKey:name];//这行可以注释掉?????
        } else {
            //model
            [dic setObject:[self dicFromObject:value] forKey:name];
        }
    }
    
    return [dic copy];
}



//将可能存在model数组转化为普通数组
- (id)arrayOrDicWithObject:(id)origin {
    if ([origin isKindOfClass:[NSArray class]]) {
        //数组
        NSMutableArray *array = [NSMutableArray array];
        for (NSObject *object in origin) {
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [array addObject:object];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [array addObject:[self arrayOrDicWithObject:(NSArray *)object]];
                
            } else {
                //model
                [array addObject:[self dicFromObject:object]];
            }
        }
        
        return [array copy];
        
    } else if ([origin isKindOfClass:[NSDictionary class]]) {
        //字典
        NSDictionary *originDic = (NSDictionary *)origin;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (NSString *key in originDic.allKeys) {
            id object = [originDic objectForKey:key];
            
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [dic setObject:object forKey:key];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [dic setObject:[self arrayOrDicWithObject:object] forKey:key];
                
            } else {
                //model
                [dic setObject:[self dicFromObject:object] forKey:key];
            }
        }
        
        return [dic copy];
    }
    
    return [NSNull null];
}


- (NSArray *)DZQ_DictionaryArrayToModel:(NSArray *)array{
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (NSDictionary *innerDict in array) {
        id innerModel = [self.class DZQ_ModelWithDictionary:innerDict];
        if (innerModel) {
            [modelArr addObject:innerModel];
        }
    }
    return modelArr.copy;
}


- (NSString *)StringValue{
    id value = self;
    if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]) {
        return [value DZQ_ModelToJSONString];
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else {
        return [value description];
    }
}


@end
