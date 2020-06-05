//
//  DZLocalContext.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "EFSQLiteContext.h"
#import "GlobalModel.h"

@interface DZLocalContext : EFSQLiteContext

+ (DZLocalContext *)shared;

- (BOOL)removeLocalUserData;

-(DZUserModel *)GetLocalUser;

- (BOOL)updateLocalUser:(DZUserModel *)User;




@end


