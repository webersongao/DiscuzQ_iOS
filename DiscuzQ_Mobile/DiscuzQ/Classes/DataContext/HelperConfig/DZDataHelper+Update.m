//
//  DZDataHelper+Update.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDataHelper+Update.h"
#import "DataBaseHeader.h"

@implementation DZDataHelper (Update)

- (void)localUpgrade:(FMDatabase *)database version:(NSUInteger)oriVersion currentVersion:(NSUInteger)currentVersion{
    
    /*
     if (![database columnExists:@"bookGiftBagType" inTableWithName:@"BookTable"]) {
     [database executeUpdate:[NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN bookGiftBagType bool DEFAULT 0", @"BookTable"]];
     }
     */
    
}


@end
