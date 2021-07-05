//
//  DZDataHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZDataHelper.h"
#import "FMDatabase.h"
#import "DZCacheHelper.h"
#import "DataBaseHeader.h"
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"

static DZDataHelper *KInstance;

static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;

@interface DZDataHelper ()
{
    dispatch_queue_t  m_backQueue;
}

@end

@implementation DZDataHelper

+ (DZDataHelper *)sharedHelper {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        KInstance = [[DZDataHelper alloc] initWithPath:[self localDBPath] andVersion:kDZLocalDBVersion];
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
    DZDataHelper *currentSyncQueue = (__bridge id)dispatch_get_specific(kDispatchQueueSpecificKey);
    assert(currentSyncQueue != self && "inDatabase: was called reentrantly on the same queue, which would lead to a deadlock");
#endif
    FMDBRetain(self);
    dispatch_sync(m_backQueue, ^() {
        FMDatabase *db = [self database];
        block(db);
        if ([db hasOpenResultSets]) {
            KSLog(@"Warning: there is at least one open result set around after performing [FMDatabaseQueue inDatabase:]");
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
    [self localUpgrade:database version:databaseVersion currentVersion:currentVersion];
}

- (void)onCreate:(FMDatabase *)database
{
    // 1、用户数据表(包含 User Token 数据)
    [self databaseCreateForUser:database];
    
    // 2、站点基本信息 数据表
    [self databaseCreateForForum:database];
    
    // 3、全站 主题分类 数据表
    [self databaseCreateForThreadCate:database];
    
    // 4、主题草稿箱 数据表
    [self databaseCreateForThreadDraft:database];
    
    // 5 系统通知 数据表
    [self databaseCreateForNotification:database];
    
    // 6、私信 对话列表 数据表
    [self databaseCreateForDialog:database];
    
    // 7、私信 对话详情 数据表
    [self databaseCreateForMessage:database];
    
    // 8、用户表情包 数据表
    [self databaseCreateForEmoji:database];
    
}

+ (NSString *)localDBPath{
    NSString *dataPath = [self getLocalPreferencePath];
    //    KSLog(@"WBS 数据库地址是 %@",path);
    NSString *localDBPath = [dataPath stringByAppendingPathComponent:kDZLocalDBFileName];
    return localDBPath;
}

+ (NSString*)getLocalPreferencePath
{
    NSString* docPath = [DZFileManager Shared].dz_DocumentPath;
    docPath = [NSString stringWithFormat:@"/%@/%@",docPath,@".Preferences/"];
    NSString *locaPath = [[DZFileManager Shared] dz_CreateFolderAtPath:docPath];
    
    return locaPath;
}

@end
