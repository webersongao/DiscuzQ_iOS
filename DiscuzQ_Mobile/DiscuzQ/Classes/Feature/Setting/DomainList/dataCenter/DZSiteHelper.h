//
//  DZSiteHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZSiteItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZSiteHelper : NSObject

@property (nonatomic, copy) NSString *siteUrlString;  //!< <#属性注释#>

+ (instancetype)shared;

+(NSArray<DZSiteItem *> *)localSiteDataArray;


+(void)saveToLocalSiteDataArray:(NSArray <DZSiteItem *>*)dataArray;


-(BOOL)updateLocalUrlDomain:(NSString *)urlDomain;




@end

NS_ASSUME_NONNULL_END
