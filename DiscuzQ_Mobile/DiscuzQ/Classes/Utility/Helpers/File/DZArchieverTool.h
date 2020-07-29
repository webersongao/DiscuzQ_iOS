//
//  DZArchieverTool.h
//  Travel
//
//  Created by WebersonGao on 17/11/8.
//  Copyright © 2015年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

// 归档工具类
@interface DZArchieverTool : NSObject

// 归档方法
+ (NSData *)Archiever:(id)object forKey:(NSString *)key;

// 反归档方法
+ (id)UnArchiever:(NSData *)data forKey:(NSString *)key;

@end
