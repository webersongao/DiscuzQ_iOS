//
//  DZDataContext.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZDataContext.h"
#import "DZDataHelper.h"
#import "DataBaseHeader.h"

static DZDataContext *infoContext;

@implementation DZDataContext

+ (DZDataContext *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        infoContext = [[DZDataContext alloc] init];
    });
    return infoContext;
}

- (id)init{
    self = [super init];
    if (self) {
        _helper = [DZDataHelper sharedHelper];
    }
    return self;
}

-(BOOL)removeLocalUserData{
    __block BOOL result = YES;
    [_helper inTransaction:^(FMDatabase *database, BOOL *rollback) {
        result = [database executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@", kDZDataUserTable]];
        *rollback = !result;
    }];
    return result;
}

- (BOOL)updateLocalUser:(DZUserM *)User{
    
    if (!User) {
        return NO;
    }
    BOOL ret = [self updateObject:User];
    if (!ret) {
      ret = [self addObject:User];
    }
    return ret;
}

-(DZUserM *)GetLocalUser{
    
    __block NSMutableArray *userArr = [NSMutableArray array];
    [_helper inTransaction:^(FMDatabase *database, BOOL *rollback) {
        FMResultSet *resultSet = [database executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ order by rowID desc",kDZDataUserTable]];
        while ([resultSet next]) {
            NSDictionary *dict = [resultSet resultDictionary];
            DZUserM *  user = [DZUserM user_modelWithDictionary:dict];
            [userArr addObject:user];
        }
        [resultSet close];
    }];
    DZUserM *User = userArr.firstObject;
    if ([User isKindOfClass:[DZUserM class]]) {
        return User;
    }else{
        return nil;
    }
}



#pragma mark   /********************* 工具方法 *************************/



@end
