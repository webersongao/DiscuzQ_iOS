//
// Created by yizhuolin on 12-10-19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "EFSQLiteContext.h"
#import "EFSQLiteObject.h"
#import "FMDatabase.h"
#import "KeyValuePair.h"
#import "EFSQLiteHelper.h"
#import "FMDatabaseAdditions.h"

@interface EFSQLiteContext ()

- (NSString *)buildUpdateSQL:(EFSQLiteObject *)object;

- (NSString *)buildInsertSQL:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option;

- (NSString *)buildDeleteSQL:(EFSQLiteObject *)object;


@end

static NSMutableDictionary *sUpdateSQLs;
static NSMutableDictionary *sInsertSQLs;
static NSMutableDictionary *sDeleteSQLs;

@implementation EFSQLiteContext

+ (void)initialize
{
    [super initialize];
    sUpdateSQLs = [[NSMutableDictionary alloc] init];
    sInsertSQLs = [[NSMutableDictionary alloc] init];
    sDeleteSQLs = [[NSMutableDictionary alloc] init];
}


- (BOOL)addObject:(EFSQLiteObject *)object
{
    return [self addObject:object withConflictOption:ConflictOptionAbort];
}

- (BOOL)addObjects:(NSArray *)objects
{
    return [self addObjects:objects withConflictOption:ConflictOptionAbort];
}

- (BOOL)addObject:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option
{
    __block BOOL result;
    
    [_helper inDatabase:^(FMDatabase *database) {
        result = [self addObject:object withConflictOption:option toDatabase:database];
    }];
    
    return result;
}

// WBS
- (BOOL)addObject:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option toDatabase:(FMDatabase *)database
{
    NSString *className = @(object_getClassName([object class]));
    
    NSString *insertSQL = [sInsertSQLs objectForKey:className];
    
    if (!insertSQL)
    {
        insertSQL = [self buildInsertSQL:object withConflictOption:option];
        [sInsertSQLs setObject:insertSQL forKey:className];
    }
    
    NSArray *fields = object.fieldsForPersistence;
    NSMutableArray *fieldValues = [[NSMutableArray alloc] initWithCapacity:[fields count]];
    
    for (KeyValuePair *pair in fields)
    {
        if ([object valueForKey:pair.key] == nil || [[object valueForKey:pair.key] isKindOfClass:[NSNull class]])
        {
            [fieldValues addObject:@""];
        }
        else
        {
            id innerObj = [object valueForKey:pair.key];
            Class innerObjClass = [[[object class] blobFields] valueForKey:pair.key];
            if ([innerObj isKindOfClass:innerObjClass]) {
                NSString *innerObjString = [innerObj DZQ_ModelToJSONString];
                NSData *innerData = [innerObjString dataUsingEncoding:NSUTF8StringEncoding];
                NSData *dataObj = (innerData && ![innerData isKindOfClass:[NSNull class]]) ? innerData : [object valueForKey:pair.key];
                [fieldValues addObject:dataObj];
            }else{
                [fieldValues addObject:innerObj];
            }
        }
    }
    
    return [database executeUpdate:insertSQL withArgumentsInArray:fieldValues];
}

- (BOOL)addObjects:(NSArray *)objects withConflictOption:(ConflictOption)option
{
    __block BOOL result;
    
    [_helper inTransaction:^(FMDatabase *database, BOOL *rollback) {
        for (EFSQLiteObject *object in objects) {
            *rollback = ![self addObject:object withConflictOption:option toDatabase:database];
            
            if (*rollback) {
                break;
            }
        }
        
        result = !*rollback;
    }];
    
    return result;
}

- (BOOL)removeObject:(EFSQLiteObject *)object
{
    __block BOOL result;
    
    NSString *className = [NSString stringWithFormat:@"%s", object_getClassName([object class])];
    
    NSString *deleteSQL = [sDeleteSQLs objectForKey:className];
    
    if (!deleteSQL) {
        deleteSQL = [self buildDeleteSQL:object];
        [sDeleteSQLs setObject:deleteSQL forKey:className];
    }
    
    NSArray *primaryKey = object.primaryKey;
    NSMutableArray *fieldValues = [[NSMutableArray alloc] initWithCapacity:[primaryKey count]];
    
    for (NSString *field in primaryKey) {
        [fieldValues addObject:[object valueForKey:field]];
    }
    
    [_helper inDatabase:^(FMDatabase *database) {
        result = [database executeUpdate:deleteSQL withArgumentsInArray:fieldValues];
    }];
    
    return result;
}


- (BOOL)updateObject:(EFSQLiteObject *)object
{
    if (![object.changedFields count]) {
        [object endModification];
        return false;
    }
    
    NSString *className = [NSString stringWithFormat:@"%s", object_getClassName([object class])];
    
    NSString *keyForUpdateSQL = [[object.changedFields componentsJoinedByString:@""] stringByAppendingString:className];
    
    NSString *updateSQL;
    
    updateSQL = [sUpdateSQLs objectForKey:keyForUpdateSQL];
    
    if (!updateSQL) {
        updateSQL = [self buildUpdateSQL:object];
        [sUpdateSQLs setObject:updateSQL forKey:keyForUpdateSQL];
    }
    
    __block BOOL result;
    
    NSArray *fields = object.changedFields;
    NSMutableArray *fieldValues = [[NSMutableArray alloc] initWithCapacity:[fields count] + [object.primaryKey count]];
    
    for (NSString *field in fields) {
        [fieldValues addObject:[object valueForKey:field]];
    }
    
    for (NSString *field in object.primaryKey) {
        [fieldValues addObject:[object valueForKey:field]];
    }
    
    
    [_helper inDatabase:^(FMDatabase *database) {
        result = [database executeUpdate:updateSQL withArgumentsInArray:fieldValues];
    }];
    
    if (result == NO) {
    }
    [object endModification];
    
    return result;
}


#pragma mark - private

- (NSString *)buildUpdateSQL:(EFSQLiteObject *)object
{
    NSArray *primaryKey = object.primaryKey;
    NSMutableString *whereClause = [[NSMutableString alloc] init];
    
    if (![primaryKey count]) {
        [NSException raise:@"Invalid Primary Key" format:@"No primary key defined in %@", object];
    } else {
        for (NSString *key in primaryKey) {
            [whereClause appendFormat:@"%@ = ?", key];
            [whereClause appendString:@" AND "];
        }
    }
    
    NSArray *fields = object.changedFields;
    NSMutableString *updateFields = [[NSMutableString alloc] init];
    
    for (NSString *field in fields) {
        [updateFields appendFormat:@"%@ = ?", field];
        [updateFields appendString:@","];
    }
    
    return [[NSString alloc] initWithFormat:@"UPDATE %@ SET %@ WHERE %@", object.tableName, [updateFields substringToIndex:[updateFields length] - 1], [whereClause substringToIndex:[whereClause length] - 5]];
}

- (NSString *)buildInsertSQL:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option
{
    NSMutableString *paramNames = [[NSMutableString alloc] init];
    NSMutableString *paramValues = [[NSMutableString alloc] init];
    NSArray *fields = object.fieldsForPersistence;
    
    for (KeyValuePair *field in fields) {
        if ([((NSString *) field.value) rangeOfString:@"R,"].location == NSNotFound && [((NSString *) field.value) rangeOfString:@",R"].location == NSNotFound) {
            [paramNames appendString:field.key];
            [paramNames appendString:@","];
            [paramValues appendString:@"?"];
            [paramValues appendString:@","];
        }
    }
    
    NSString *optionString;
    
    switch (option) {
        case ConflictOptionFail: {
            optionString = @"OR FAIL";
            break;
        }
        case ConflictOptionIgnore: {
            optionString = @"OR IGNORE";
            break;
        }
        case ConflictOptionReplace: {
            optionString = @"OR REPLACE";
            break;
        }
        case ConflictOptionRollback: {
            optionString = @"OR ROLLBACK";
            break;
        }
        default: {
            optionString = @"";
            break;
        }
    }
    
    return [[NSString alloc] initWithFormat:@"INSERT %@ INTO %@(%@) VALUES(%@);",
            optionString,
            object.tableName ? : @(object_getClassName(object)),
            [paramNames substringToIndex:[paramNames length] - 1],
            [paramValues substringToIndex:[paramValues length] - 1]];
}

- (NSString *)buildDeleteSQL:(EFSQLiteObject *)object
{
    NSArray *primaryKey = object.primaryKey;
    NSMutableString *param = [[NSMutableString alloc] init];
    
    if (![primaryKey count]) {
        [NSException raise:@"Invalid Primary Key" format:@"No primary key defined in %@", object];
    } else {
        for (NSString *key in primaryKey) {
            [param appendFormat:@"%@ = ?", key];
            [param appendString:@" AND "];
        }
    }
    
    return [[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE %@", object.tableName ? : @(object_getClassName(object)), [param substringToIndex:[param length] - 5]];
}


- (DBExcuteType)addColumToTable:(NSString *)table withPram:(NSDictionary *)prams withArray:(NSArray *)keyArray
{
    __block BOOL success = NO;
    
    NSArray *tmpKeys = [NSArray arrayWithArray:keyArray];
    
    [_helper inDatabase:^(FMDatabase *db){
        for(NSString *colum in tmpKeys){
            if(![db columnExists:colum inTableWithName:table])
            {
                NSString *typeValue = [prams objectForKey:colum];
                
                success = [db executeUpdate:[NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@",table,colum,typeValue]];
                
                NSAssert(success, @"alter table failed: %@", [db lastErrorMessage]);
            }
            else
            {
                success = DBExcuteFree;
            }
        }
    }];
    return success;
}

//tmpsql 必须是create table
- (BOOL)createTableWithSqlString:(NSString *)tmpSql
{
    __block BOOL result;
    
    [_helper inDatabase:^(FMDatabase *database) {
        result = [database executeUpdate:tmpSql];
    }];
    
    return result;
}

@end
