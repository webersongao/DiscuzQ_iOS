//
//  DZLocalDataHelper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "EFSQLiteHelper.h"

@interface DZLocalDataHelper : EFSQLiteHelper

+ (DZLocalDataHelper *)sharedHelper;

@end

