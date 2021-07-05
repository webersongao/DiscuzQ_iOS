//
//  DZDataHelper+DialogM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+DialogM.h"

@implementation DZDataHelper (DialogM)


- (void)databaseCreateForDialog:(FMDatabase *)database{
    
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DQ_SessionListTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DQ_SessionListTable\" (\n"
     "\t \"taskId\" text NOT NULL,\n"
     "\t \"fragMD5\" text NOT NULL,\n"
     "\t \"serverPath\" text NOT NULL,\n"
     
     "\t \"fragId\" text NOT NULL,\n"
     "\t \"fragUrlTag\" double NOT NULL,\n"
     "\t \"fragSizeRatio\" double NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     
     ");"];
    
}



@end
