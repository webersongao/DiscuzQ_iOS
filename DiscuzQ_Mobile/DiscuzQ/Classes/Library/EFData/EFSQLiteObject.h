//
// Created by yizhuolin on 12-10-19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

#define FieldName(property) [[@(#property) componentsSeparatedByString: @"."] lastObject]

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

@end
