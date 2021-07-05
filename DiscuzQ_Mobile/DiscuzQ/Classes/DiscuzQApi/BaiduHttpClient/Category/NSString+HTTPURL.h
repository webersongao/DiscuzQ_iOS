//
//  NSString+HTTPURL.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HTTPURL)

NSString* addUrlParam(NSString *baseurl, NSString *param);


+ (NSString *)appendCommonParamsUrl:(NSString *)baseUrl;

+ (void)rebuiltUrlParams:(NSDictionary *)rootDictionary url:(NSString *)requestUrl;



@end

NS_ASSUME_NONNULL_END
