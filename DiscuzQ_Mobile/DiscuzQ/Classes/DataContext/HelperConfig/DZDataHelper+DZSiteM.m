//
//  DZDataHelper+DZSiteM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+DZSiteM.h"

@implementation DZDataHelper (DZSiteM)

- (void)databaseCreateForForum:(FMDatabase *)database{
    
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DQ_SiteInfoTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DQ_SiteInfoTable\" (\n"
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


@end
