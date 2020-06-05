//
//  NSDictionary+Utils.h
//  DiscuzQ
//
//  Created by rexshi on 9/27/11.
//  Copyright 2011 WebersonGao. All rights reserved.
//

@interface NSDictionary (Utils)

// 根据key对dict排序并形成数组
- (NSArray *)sortedValueByKeyInDesc:(BOOL)desc;

// 列出排序好的keys
- (NSArray *)sortedKeyInDesc:(BOOL)desc;

// return an empty string if the value is NSNull or not a string.
- (NSString *)stringForKey:(id)key;

//return nil if the object is NSNull or not a NSDictionary
- (NSDictionary *)dictionaryForKey:(id)key;

//return nil if the object is null or not a NSArray.
- (NSArray *)arrayForKey:(id)key;

- (BOOL)boolForKey:(id)key;

-(NSInteger) intergerForKey:(id)key;

-(long long) longLongForKey:(id)key;

-(NSInteger) DZIntergerForKey:(id)key;

-(NSInteger) DZDoubleForKey:(id)key;

+(NSDictionary *) dictionaryWithData:(NSData *) data;

/**
 WBS 字典转json串
 */
-(NSString *)convertDictionaryToJsonString;







@end

