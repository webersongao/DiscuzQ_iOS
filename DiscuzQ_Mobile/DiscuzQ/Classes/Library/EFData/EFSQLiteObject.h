//
// Created by yizhuolin on 12-10-19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

#define FieldName(property) [[@(#property) componentsSeparatedByString: @"."] lastObject]

@interface EFSQLData : NSObject
// 特殊的专门用来存储 对象的类型 对应数据库的data类型
- (NSDictionary *)EF_modelToDictionary;

@end

@interface EFSQLiteObject : NSObject

@property(nonatomic, readonly) NSArray *excludedFields;
@property(nonatomic, readonly) NSArray *changedFields;
@property(nonatomic, readonly, getter=fieldsForPersistence) NSArray *fieldsForPersistence;
@property(nonatomic, readonly) NSArray *primaryKey;
@property(nonatomic, readonly) NSString *tableName;


- (void)startModification;

- (void)endModification;

- (void)startUpdateProperties:(NSArray *)properties;

- (void)removeUpdateProperties;

/// 需要特殊处理的二进制对象
+(NSDictionary<NSString *,Class> *)blobFields;

@end
