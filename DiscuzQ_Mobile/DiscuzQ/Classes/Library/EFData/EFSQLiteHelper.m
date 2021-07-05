//
// Created by yizhuolin on 12-8-30.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "EFSQLiteHelper.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface EFSQLiteHelper () {
    NSUInteger _version;
    NSString *_path;
}

@property (nonatomic, readonly) FMDatabase *database;

- (void)beginTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *, BOOL *))block;

- (NSUInteger)version:(FMDatabase *)database;

- (void)setVersion:(NSUInteger)version database:(FMDatabase *)database;

@end

static IllegalDatabaseVersionFoundHandler sHandler;

@implementation EFSQLiteHelper

- (id)init
{
    return nil;
}

- (id)initWithPath:(NSString *)path andVersion:(NSUInteger)version
{
    self = [super init];

    if (self) {
        _path = [path copy];
        _version = version;
    }

    return self;
}

- (FMDatabase *)database
{
    if (_database && _database.sqliteHandle) {
        return _database;
    }

    BOOL success = false;
    FMDatabase *database = nil;

    @try {
        database = [[FMDatabase alloc] initWithPath:_path];

        if ([database open]) {
            //we don't need to check version when using temporary or in-memory database
            if ([_path length]) {
                NSUInteger version = [self version:database];

                if (version > _version) {
                    if (sHandler) {
                        sHandler(version, _version);
                        return nil;
                    }

                    [NSException raise:@"Database version error" format:@"Can't downgrade database from %zd to %zd", version, _version];
                }

                if (version < _version) {
                    [database beginTransaction];

                    @try {
                        if (version == 0) {
                            [self onCreate:database];
                        } else {
                            [self onUpgrade:database databaseVersion:version currentVersion:_version];
                        }

                        [self setVersion:_version database:database];
                        [database commit];
                    } @catch (NSException *e) {
                        [database rollback];
                    }
                }
            }

            [self onOpen:database];
            success = true;

            return database;
        }
    } @finally {
        //database may be closed after calling onOpen
        if ([database sqliteHandle]) {
            if (success) {
                if (_database) {
                    [_database close];
                }

                _database = database;
            } else {
                if (database) {
                    [database close];
                }
            }
        }
    }

    return _database;
}

- (void)onCreate:(FMDatabase *)database
{
    [NSException raise:@"Illegal function call" format:@"you must subclass EFSQLiteHelper and override this method.Do not call super method when overriding"];
}

+ (void)addIllegalDatabaseVersionFoundHandler:(void (^)(NSInteger, NSInteger))block
{
    sHandler = [block copy];
}


- (void)onUpgrade:(FMDatabase *)database databaseVersion:(NSUInteger)databaseVersion currentVersion:(NSUInteger)currentVersion
{
    [NSException raise:@"Illegal function call" format:@"you must subclass EFSQLiteHelper and override this method.Do not call super method when overriding"];
}

- (void)close
{
    @synchronized (self) {
        [_database close];
        _database = nil;
    }
}

- (void)inDatabase:(void (^)(FMDatabase *db))block
{
//    KSLog("read db %@", self)
    @synchronized (self) {
//        KSLog("open db %@", self)
        FMDatabase *db = [self database];
//        KSLog("end open db %@", self)
        block(db);
//        KSLog("end read db %@", self)

        if ([db hasOpenResultSets]) {
//            KSLog(@"Warning: there is at least one open result set around after performing [inDatabase:]");
        }
    }
}

- (void)inDeferredTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block
{
    [self beginTransaction:YES withBlock:block];
}

- (void)inTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block
{
    [self beginTransaction:NO withBlock:block];
}

- (void)beginTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *db, BOOL *rollback))block
{
    @synchronized (self) {
        BOOL shouldRollback = NO;

        if (useDeferred) {
            [[self database] beginDeferredTransaction];
        }
        else {
            [[self database] beginTransaction];
        }

        block([self database], &shouldRollback);

        if (shouldRollback) {
            [[self database] rollback];
        }
        else {
            [[self database] commit];
        }
    }
}

- (void)onOpen:(FMDatabase *)database;
{
    [NSException raise:@"Illegal function call" format:@"you must subclass EFSQLiteHelper and override this method.Do not call super method when overriding"];
}

- (NSUInteger)version:(FMDatabase *)database
{
    return (NSUInteger) [database intForQuery:@"PRAGMA user_version"];
}

- (void)setVersion:(NSUInteger)version database:(FMDatabase *)database
{
    [database executeUpdate:[NSString stringWithFormat:@"PRAGMA user_version = %zd", version]];
}

- (void)dealloc
{
    [_database close];
    _database = nil;
}

@end
