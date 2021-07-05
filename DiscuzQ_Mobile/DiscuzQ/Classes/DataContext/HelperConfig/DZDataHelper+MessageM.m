//
//  DZDataHelper+MessageM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+MessageM.h"

@implementation DZDataHelper (MessageM)

- (void)databaseCreateForMessage:(FMDatabase *)database{
    
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DQ_MessageListTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DQ_MessageListTable\" (\n"
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
