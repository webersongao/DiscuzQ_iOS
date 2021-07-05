//
//  DZDataHelper+UserM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+UserM.h"

@implementation DZDataHelper (UserM)

- (void)databaseCreateForUser:(FMDatabase *)database{
   
    [database executeUpdate:@"DROP TABLE IF EXISTS \"DQ_UserInfoTable\";"];
    [database executeUpdate:@"CREATE TABLE \"DQ_UserInfoTable\" (\n"
     
     "\t \"user_id\" text NOT NULL,\n"
     "\t \"username\" text NOT NULL,\n"
     "\t \"avatarUrl\" text NOT NULL,\n"
     "\t \"isReal\" bool NOT NULL,\n"
     "\t \"threadCount\" integer DEFAULT 0,\n"
     "\t \"followCount\" integer DEFAULT 0,\n"
     "\t \"fansCount\" integer DEFAULT 0,\n"
     "\t \"follow\" integer DEFAULT 0,\n"
     "\t \"status\" integer DEFAULT 0,\n"
     
     "\t \"loginAt\" text NOT NULL,\n"
     "\t \"joinedAt\" text NOT NULL,\n"
     "\t \"expiredAt\" text NOT NULL,\n"
     "\t \"createdAt\" text NOT NULL,\n"
     "\t \"updatedAt\" text NOT NULL,\n"
     
     "\t \"canEdit\" bool NOT NULL,\n"
     "\t \"canDelete\" bool NOT NULL,\n"
     "\t \"showGroups\" bool NOT NULL,\n"
     
     "\t \"registerReason\" text NOT NULL,\n"
     "\t \"banReason\" text NOT NULL,\n"
     "\t \"paid\" text NOT NULL,\n"
     "\t \"payTime\" text NOT NULL,\n"
     
     "\t \"unreadNotifications\" integer DEFAULT 0,\n"
     
     "\t \"tokenModel\" blob NOT NULL,\n"
     
     "\t \"rowID\" integer NOT NULL PRIMARY KEY AUTOINCREMENT \n"
     ");"];
    
}




@end
