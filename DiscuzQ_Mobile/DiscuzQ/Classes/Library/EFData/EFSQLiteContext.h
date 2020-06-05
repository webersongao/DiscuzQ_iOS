//
// Created by yizhuolin on 12-10-19.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class FMDatabase;
@class EFSQLiteObject;
@class EFSQLiteHelper;

typedef enum {
    ConflictOptionRollback,
    ConflictOptionAbort,
    ConflictOptionIgnore,
    ConflictOptionFail,
    ConflictOptionReplace
} ConflictOption;


typedef enum
{
    DBExcuteFail,
    DBExcuteSuccess,
    DBExcuteFree
    
}DBExcuteType;


@interface EFSQLiteContext : NSObject {
    EFSQLiteHelper *_helper;
}

- (BOOL)addObject:(EFSQLiteObject *)object;

- (BOOL)addObjects:(NSArray *)objects;

- (BOOL)addObject:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option;

// WBS
- (BOOL)addObject:(EFSQLiteObject *)object withConflictOption:(ConflictOption)option toDatabase:(FMDatabase *)database;

- (BOOL)addObjects:(NSArray *)objects withConflictOption:(ConflictOption)option;

- (BOOL)removeObject:(EFSQLiteObject *)object;

- (BOOL)updateObject:(EFSQLiteObject *)object;

- (DBExcuteType)addColumToTable:(NSString *)table withPram:(NSDictionary *)prams withArray:(NSArray *)keyArray;

- (BOOL)createTableWithSqlString:(NSString *)tmpSql;

@end
