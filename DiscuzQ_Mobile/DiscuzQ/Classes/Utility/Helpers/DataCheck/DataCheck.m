//
//  DataCheck.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/7.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DataCheck.h"

@implementation DataCheck
//判断是否 有效 或者 是健全的 数组 字典 字符串 
+ (BOOL) isValidString:(id)input
{
    if (!input) {
        return NO;
    }
    
    if ((NSNull *)input == [NSNull null]) {
        return NO;
    }
    
    if (![input isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([input isEqualToString:@"(null)"]) {
        return NO;
    }
    if ([input isEqualToString:@""]) {
        return NO;
    }
    
    return YES;
}

+ (BOOL) isValidDict:(id)input
{
    if (!input) {
        return NO;
    }
    
    if ((NSNull *)input == [NSNull null]) {
        return NO;
    }
    
    if (![input isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    
    if ([input count] <= 0) {
        return NO;
    }
    
    return YES;
}

+ (BOOL) isValidArray:(id)input
{
    if (!input) {
        return NO;
    }
    
    if ((NSNull *)input == [NSNull null]) {
        return NO;
    }
    
    if (![input isKindOfClass:[NSArray class]]) {
        return NO;
    }
    
    if ([input count] <= 0) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)arrayA:(NSArray *)arrayA isEqualArrayB:(NSArray *)arrayB {
    if (![DataCheck isValidArray:arrayA] || ![DataCheck isValidArray:arrayB]) {
        return NO;
    }
    if (arrayA.count != arrayB.count) {
        return NO;
    }
    
    return YES;
}


+(NSString *)rebuiltParams:(NSDictionary *)rootDictionary url:(NSString *)requestUrl{
    
    NSMutableString *mutableString =[NSMutableString string];
    if (![rootDictionary isKindOfClass:[NSDictionary class]] && rootDictionary != nil) {
        return requestUrl;
    }
    for (NSString *key in [rootDictionary allKeys]) {
        NSString *value = rootDictionary[key];
        NSString *keyAndValue = [[NSString alloc]initWithFormat:@"&%@=%@",key,value];
        [mutableString appendFormat:@"%@",keyAndValue];
    }
    [mutableString insertString:requestUrl atIndex:0];
    
    return mutableString.copy;
}

@end
