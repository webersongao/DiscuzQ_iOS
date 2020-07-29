//
//  NSFileManager+PathMethod.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/2/2.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (PathMethod)
/**
*   判断指定路径下的文件，是否超出规定时间的方法
*
*  @param path 文件路径
*  @param time NSTimeInterval 毫秒
*
*  @return 是否超时
*/
+(BOOL)isTimeOutWithPath:(NSString *)path timeOut:(NSTimeInterval)time;

@end

@interface NSString (UTF8Encoding)

+ (NSString *)dz_urlString:(NSString *)urlString appendingParameters:(id)parameters;
+ (NSString *)dz_stringUTF8Encoding:(NSString *)urlString;

@end
