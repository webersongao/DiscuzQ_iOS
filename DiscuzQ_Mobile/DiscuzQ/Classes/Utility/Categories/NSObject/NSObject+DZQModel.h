//
//  NSObject+DZQModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  字典转模型

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DZQModel)

/// JSON 转 模型
+ (nullable instancetype)DZQ_ModelWithJSON:(id)json;

/// 字典 转 模型
+ (nullable instancetype)DZQ_ModelWithDictionary:(NSDictionary *)dictionary;

/// 是否可以 转模型 json
- (BOOL)DZQ_ModelSetWithJSON:(id)json;

/// 是否可以 转模型 NSDictionary
- (BOOL)DZQ_ModelSetWithDictionary:(NSDictionary *)dic;

/// 转 JSON对象
- (nullable id)DZQ_ModelToJSONObject;

/// 转 Data
- (nullable NSData *)DZQ_ModelToJSONData;

/// 转 字符串
- (nullable NSString *)DZQ_ModelToJSONString;

/// 拷贝
- (nullable id)DZQ_ModelCopy;

/// 哈希值
- (NSUInteger)DZQ_ModelHash;

/// 是否相等
- (BOOL)DZQ_ModelIsEqual:(id)model;

/// description
- (NSString *)DZQ_ModelDescription;

/// encode
- (void)DZQ_ModelEncodeWithCoder:(NSCoder *)aCoder;

/// decoder
- (id)DZQ_ModelInitWithCoder:(NSCoder *)aDecoder;

@end



/**
 Provide some data-model method for NSArray.
 */
@interface NSArray (DZQModel)

/// json  转 模型数组
+ (nullable NSArray *)DZQ_ModelArrayWithClass:(Class)cls json:(id)json;

@end



/**
 Provide some data-model method for NSDictionary.
 */
@interface NSDictionary (DZQModel)

/// json  转 模型字典
+ (nullable NSDictionary *)DZQ_ModelDictionaryWithClass:(Class)cls json:(id)json;

@end

NS_ASSUME_NONNULL_END
