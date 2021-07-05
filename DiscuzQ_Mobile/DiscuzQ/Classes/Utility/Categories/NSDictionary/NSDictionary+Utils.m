//
//  NSDictionary+Utils.m
//  DiscuzQ
//
//  Created by rexshi on 9/27/11.
//  Copyright 2011 WebersonGao. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (NSArray *)sortedKeyInDesc:(BOOL)desc
{
    NSArray *allKeys = [self allKeys];
    
    NSArray *sortedAllKeys = nil;
    if (desc == YES) {
        sortedAllKeys = [allKeys sortedArrayUsingComparator: ^(id obj1, id obj2) {
            if ([obj1 intValue] > [obj2 intValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            if ([obj1 intValue] < [obj2 intValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    } else {
        sortedAllKeys = [allKeys sortedArrayUsingComparator: ^(id obj1, id obj2) {
            if ([obj1 intValue] > [obj2 intValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([obj1 intValue] < [obj2 intValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    }
    
    return sortedAllKeys;
}

- (NSArray *)sortedValueByKeyInDesc:(BOOL)desc
{    
    NSArray *sortedAllKeys = [self sortedKeyInDesc:desc];

    NSMutableArray *newArray = [NSMutableArray array];
    for (NSString *key in sortedAllKeys) {
        [newArray addObject:[self objectForKey:key]];
    }
    
    return newArray;
}

//return an empty string if the value is null or not a string.
- (NSString *)stringForKey:(id)key
{
    NSString *result = [self objectForKey:key];
    if([result isKindOfClass:[NSString class]])
    {
        return result;
    }else if ([result isKindOfClass:[NSObject class]]){
        return [NSString stringWithFormat:@"%@",result];
    }else {
        return @"";
    }
}

-(BOOL) boolForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result boolValue];
     }else {
        return false;
    }
}

-(NSInteger) intergerForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result integerValue];
     }else {
        return -1;
    }
}

-(long long) longLongForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result longLongValue];
    }else {
        return -1;
    }
}

-(NSInteger) DZIntergerForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result integerValue];
     }else {
        return 0;
    }
}

-(NSInteger) DZDoubleForKey:(id)key {
    id result = [self objectForKey:key];
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result doubleValue];
     }else {
        return 0;
    }
}

//return nil if the object is null or not a NSDictionary.
- (NSDictionary *)dictionaryForKey:(id)key
{
    NSDictionary *result = [self objectForKey:key];
    if([result isKindOfClass:[NSDictionary class]])
    {
        return result;
     }else {
        return nil;
    }
}

//return nil if the object is null or not a NSArray.
- (NSArray *)arrayForKey:(id)key
{
    NSArray *result = [self objectForKey:key];
    if([result isKindOfClass:[NSArray class]])
    {
        return result;
     }else {
        return nil;
    }
}

+(NSDictionary *) dictionaryWithData:(NSData *) data
{
    NSError *resDictionaryError = nil;
    NSDictionary *resDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&resDictionaryError];
    if (resDictionaryError) {
        return nil;
    }else {
        if ([resDictionary isKindOfClass:[NSDictionary class]]) {
            return resDictionary;
        }
        return nil;
    }
    
}


/**
 WBS 字典转json串 百度网盘文件名称 可能含有空格 故不剔除空格
 */
-(NSString *)convertDictionaryToJsonString

{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
//        KSLog(@"%@",error);

    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    if (!jsonString.length) {
        return nil;
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
//
//    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range];
    
    return mutStr;
    
}






@end
