//
//  NSObject+Dictionary.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  模型转字典

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Dictionary)

/// 转字符串 （ NSDictionary NSString NSNumber ）
- (NSString *)StringValue;

/// 模型 转 字典
- (NSDictionary *)DZQ_ModelToDictionary;

/// 模型 转 字典数组
- (NSArray<NSDictionary *> *)DZQ_ModelToDictionaryArray;

/// 字典数组 转 模型数组
- (NSArray *)DZQ_DictionaryArrayToModel:(NSArray *)array;


@end

NS_ASSUME_NONNULL_END
