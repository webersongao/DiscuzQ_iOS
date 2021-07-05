//
//  DZDataHelper+ThreadCateM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+ThreadCateM.h"

@implementation DZDataHelper (ThreadCateM)

- (void)databaseCreateForThreadCate:(FMDatabase *)database{
    
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DQ_ThreadCateTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DQ_ThreadCateTable\" (\n"
     "\t \"pid\" text NOT NULL,\n"
     "\t \"name\" text NOT NULL,\n"
     "\t \"icon\" text NOT NULL,\n"
     "\t \"parentid\" text NOT NULL,\n"
     "\t \"categorydesc\" text NOT NULL,\n"
     
     
     "\t \"fragSize\" long NOT NULL,\n"
     "\t \"fragOffset\" long NOT NULL,\n"
     "\t \"fragIndex\" integer NOT NULL,\n"
     "\t \"fragUpStatus\" integer NOT NULL,\n"
     
     "\t \"sort\" integer NOT NULL,\n"
     "\t \"property\" integer NOT NULL,\n"
     "\t \"threadCount\" long long NOT NULL,\n"
     "\t \"canCreateThread\" bool NOT NULL,\n"
     
     "\t \"childSearchIds\" blob NOT NULL,\n"
     "\t \"childCategorys\" blob NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     
     ");"];
}




@end
