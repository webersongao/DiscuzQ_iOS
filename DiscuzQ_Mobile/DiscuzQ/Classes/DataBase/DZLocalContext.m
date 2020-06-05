//
//  DZLocalContext.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZLocalContext.h"
#import "DZLocalDataHelper.h"

#define kDZOAuthTable           @"DZQ_AuthTable"  /// 用户信息 以及 token
#define KDZHotForumTable        @"DZHotForumTable"
#define KDZForumIndexTable      @"DZForumIndexTable"
#define KDZThreadDraftTable     @"DZThreadDraftTable"

static DZLocalContext *infoContext;

@implementation DZLocalContext

+ (DZLocalContext *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        infoContext = [[DZLocalContext alloc] init];
    });
    return infoContext;
}

- (id)init{
    self = [super init];
    if (self) {
        _helper = [DZLocalDataHelper sharedHelper];
    }
    return self;
}

-(BOOL)removeLocalUserData{
    __block BOOL result = YES;
    [_helper inTransaction:^(FMDatabase *database, BOOL *rollback) {
        result = [database executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@", kDZOAuthTable]];
        *rollback = !result;
    }];
    return result;
}

- (BOOL)updateLocalUser:(DZUserModel *)User{
    
    if (!User) {
        return NO;
    }
    BOOL ret = [self updateObject:User];
    if (!ret) {
      ret = [self addObject:User];
    }
    return ret;
}

-(DZUserModel *)GetLocalUser{
    
    __block NSMutableArray *userArr = [NSMutableArray array];
    [_helper inTransaction:^(FMDatabase *database, BOOL *rollback) {
        FMResultSet *resultSet = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ order by rowID desc",kDZOAuthTable]];
        while ([resultSet next]) {
            NSDictionary *dict = [resultSet resultDictionary];
            DZUserModel *  user = [DZUserModel yy_modelWithJSON:dict];
            [userArr addObject:user];
        }
        [resultSet close];
    }];
    DZUserModel *User = userArr.firstObject;
    if ([User isKindOfClass:[DZUserModel class]]) {
        return User;
    }else{
        return nil;
    }
}



#pragma mark   /********************* 工具方法 *************************/



@end
