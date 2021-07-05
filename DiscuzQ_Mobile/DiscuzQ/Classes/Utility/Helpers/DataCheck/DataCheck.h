//
//  DataCheck.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/7.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCheck : NSObject

+ (BOOL) isValidString:(id)input;
+ (BOOL) isValidDict:(id)input;
+ (BOOL) isValidArray:(id)input;
+ (BOOL)arrayA:(NSArray *)arrayA isEqualArrayB:(NSArray *)arrayB;

+(NSString *)rebuiltParams:(NSDictionary *)rootDictionary url:(NSString *)requestUrl;



@end
