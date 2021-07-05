//
//  DZDataContext.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "EFSQLiteContext.h"

@interface DZDataContext : EFSQLiteContext

+ (DZDataContext *)shared;

- (BOOL)removeLocalUserData;

- (DZUserM *)GetLocalUser;

- (BOOL)updateLocalUser:(DZUserM *)User;




@end


