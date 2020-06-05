//
//  DZLocalDataHelper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZLocalDataHelper.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"

#define kDZLocalDBVersion 1
#define kDZLocalDBFileName @"PRDouMao.sqlite"

static DZLocalDataHelper *KInstance;

static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;

@interface DZLocalDataHelper ()
{
    dispatch_queue_t  m_backQueue;
}

@end

@implementation DZLocalDataHelper

+ (DZLocalDataHelper *)sharedHelper {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        KInstance = [[DZLocalDataHelper alloc] initWithPath:[self localDBPath] andVersion:kDZLocalDBVersion];
    });
    return KInstance;
}

-(id)initWithPath:(NSString *)path andVersion:(NSUInteger)version{
    self = [super initWithPath:path andVersion:version];
    if (self) {
        m_backQueue = dispatch_queue_create([[NSString stringWithFormat:@"DZInfo_fmdb.%@", self] UTF8String], NULL);
        dispatch_queue_set_specific(m_backQueue, kDispatchQueueSpecificKey, (__bridge void *)self, NULL);
    }
    return self;
}

+ (void)clearInstance
{
    KInstance = nil;
}

-(void)inTransaction:(void (^)(FMDatabase *, BOOL *))block{
    
    [self beginBueueTransaction:NO withBlock:block];
}

- (void)beginBueueTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *db, BOOL *rollback))block {
    FMDBRetain(self);
    dispatch_sync(m_backQueue, ^() {
        BOOL shouldRollback = NO;
        if (useDeferred) {
            [[self database] beginDeferredTransaction];
        }else {
            [[self database] beginTransaction];
        }
        block([self database], &shouldRollback);
        if (shouldRollback) {
            [[self database] rollback];
        }else {
            [[self database] commit];
        }
    });
    
    FMDBRelease(self);
}


-(void)inDatabase:(void (^)(FMDatabase *))block{
    [self inQueueDatabase:block];
}

- (void)inQueueDatabase:(void (^)(FMDatabase *db))block {
#ifndef NDEBUG
    /* Get the currently executing queue (which should probably be nil, but in theory could be another DB queue
     * and then check it against self to make sure we're not about to deadlock. */
    DZLocalDataHelper *currentSyncQueue = (__bridge id)dispatch_get_specific(kDispatchQueueSpecificKey);
    assert(currentSyncQueue != self && "inDatabase: was called reentrantly on the same queue, which would lead to a deadlock");
#endif
    FMDBRetain(self);
    dispatch_sync(m_backQueue, ^() {
        FMDatabase *db = [self database];
        block(db);
        if ([db hasOpenResultSets]) {
            NSLog(@"Warning: there is at least one open result set around after performing [FMDatabaseQueue inDatabase:]");
#if defined(DEBUG) && DEBUG
            NSSet *openSetCopy = FMDBReturnAutoreleased([[db valueForKey:@"_openResultSets"] copy]);
            for (NSValue *rsInWrappedInATastyValueMeal in openSetCopy) {
                FMResultSet *rs = (FMResultSet *)[rsInWrappedInATastyValueMeal pointerValue];
                KSLog(@"query: '%@'", [rs query]);
            }
#endif
        }
    });
    
    FMDBRelease(self);
}

- (void)onOpen:(FMDatabase *)database
{
    
}

- (void)onUpgrade:(FMDatabase *)database databaseVersion:(NSUInteger)databaseVersion currentVersion:(NSUInteger)currentVersion
{
    /*
     if (![database columnExists:@"bookGiftBagType" inTableWithName:@"Book"]) {
     [database executeUpdate:[NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN bookGiftBagType bool DEFAULT 0", @"Book"]];
     }
     */
}

- (void)onCreate:(FMDatabase *)database
{
    // 1、全局数据表(User Token 数据)
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DZQ_AuthTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DZQ_AuthTable\" (\n"
     
     "\t \"user_id\" text NOT NULL,\n"
     "\t \"username\" text NOT NULL,\n"
     "\t \"avatarUrl\" text NOT NULL,\n"
     "\t \"isReal\" bool NOT NULL,\n"
     "\t \"threadCount\" integer DEFAULT 0,\n"
     "\t \"followCount\" integer DEFAULT 0,\n"
     "\t \"fansCount\" integer DEFAULT 0,\n"
     "\t \"follow\" integer DEFAULT 0,\n"
     "\t \"status\" integer DEFAULT 0,\n"
     
     "\t \"loginAt\" text NOT NULL,\n"
     "\t \"joinedAt\" text NOT NULL,\n"
     "\t \"expiredAt\" text NOT NULL,\n"
     "\t \"createdAt\" text NOT NULL,\n"
     "\t \"updatedAt\" text NOT NULL,\n"
     
     "\t \"canEdit\" bool NOT NULL,\n"
     "\t \"canDelete\" bool NOT NULL,\n"
     "\t \"showGroups\" bool NOT NULL,\n"
     
     "\t \"registerReason\" text NOT NULL,\n"
     "\t \"banReason\" text NOT NULL,\n"
     "\t \"paid\" text NOT NULL,\n"
     "\t \"payTime\" text NOT NULL,\n"
     
     "\t \"unreadNotifications\" integer DEFAULT 0,\n"
     
     //     "\t \"return_type\" integer DEFAULT -1,\n"
     //     "\t \"isdir\" bool NOT NULL,\n"
     
     "\t \"token_type\" text NOT NULL,\n"
     "\t \"access_token\" text NOT NULL,\n"
     "\t \"refresh_token\" text NOT NULL,\n"
     "\t \"expires_in\" long long NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     ");"];
    
    // 2、热门板块数据表
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DZHotForumTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DZHotForumTable\" (\n"
     "\t \"taskId\" text NOT NULL,\n"
     "\t \"fragMD5\" text NOT NULL,\n"
     "\t \"serverPath\" text NOT NULL,\n"
     "\t \"fileRelatePath\" text NOT NULL,\n"
     "\t \"uploadid\" text NOT NULL,\n"
     
     "\t \"fragSize\" long NOT NULL,\n"
     "\t \"fragOffset\" long NOT NULL,\n"
     "\t \"fragIndex\" integer NOT NULL,\n"
     "\t \"fragUpStatus\" integer NOT NULL,\n"
     
     "\t \"partseq\" integer NOT NULL,\n"
     "\t \"fileFragCount\" integer NOT NULL,\n"
     "\t \"fileTotalSize\" long long NOT NULL,\n"
     
     "\t \"fragId\" text NOT NULL,\n"
     "\t \"fragUrlTag\" double NOT NULL,\n"
     "\t \"fragSizeRatio\" double NOT NULL,\n"
     
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     
     ");"];
    
    // 3、全站 所有版块 数据表
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DZForumIndexTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DZForumIndexTable\" (\n"
     "\t \"taskId\" text NOT NULL,\n"
     "\t \"fragMD5\" text NOT NULL,\n"
     "\t \"serverPath\" text NOT NULL,\n"
     "\t \"fileRelatePath\" text NOT NULL,\n"
     "\t \"uploadid\" text NOT NULL,\n"
     
     "\t \"fragSize\" long NOT NULL,\n"
     "\t \"fragOffset\" long NOT NULL,\n"
     "\t \"fragIndex\" integer NOT NULL,\n"
     "\t \"fragUpStatus\" integer NOT NULL,\n"
     
     "\t \"partseq\" integer NOT NULL,\n"
     "\t \"fileFragCount\" integer NOT NULL,\n"
     "\t \"fileTotalSize\" long long NOT NULL,\n"
     
     "\t \"fragId\" text NOT NULL,\n"
     "\t \"fragUrlTag\" double NOT NULL,\n"
     "\t \"fragSizeRatio\" double NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     
     ");"];
    
    // 4、帖子草稿 数据表
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DZThreadDraftTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DZThreadDraftTable\" (\n"
     "\t \"taskId\" text NOT NULL,\n"
     "\t \"fragMD5\" text NOT NULL,\n"
     "\t \"serverPath\" text NOT NULL,\n"
     "\t \"fileRelatePath\" text NOT NULL,\n"
     "\t \"uploadid\" text NOT NULL,\n"
     
     "\t \"fragSize\" long NOT NULL,\n"
     "\t \"fragOffset\" long NOT NULL,\n"
     "\t \"fragIndex\" integer NOT NULL,\n"
     "\t \"fragUpStatus\" integer NOT NULL,\n"
     
     "\t \"partseq\" integer NOT NULL,\n"
     "\t \"fileFragCount\" integer NOT NULL,\n"
     "\t \"fileTotalSize\" long long NOT NULL,\n"
     
     "\t \"fragId\" text NOT NULL,\n"
     "\t \"fragUrlTag\" double NOT NULL,\n"
     "\t \"fragSizeRatio\" double NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     
     ");"];
    
}

+ (NSString *)localDBPath{
    NSString *path = [self getLocalPreferencePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
//    KSLog(@"WBS 数据库地址是 %@",path);
    NSString *localDBPath = [path stringByAppendingPathComponent:kDZLocalDBFileName];
    return localDBPath;
}

+ (NSString*)getLocalPreferencePath
{
    NSString* path = nil;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingString:@"/"];
    
    path = [NSString stringWithFormat:@"%@%@",path,@".Preferences/"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

@end
