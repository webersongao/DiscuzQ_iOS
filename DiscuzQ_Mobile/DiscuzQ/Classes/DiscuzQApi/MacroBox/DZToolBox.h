//
//  DZToolBox.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZToolBox : NSObject

// 转换UIImage 为 NSData
+(NSData* _Nullable)dz_getDataFromImage:(UIImage* _Nullable)image;

// 字符串转 数组
NSArray* _Nullable DZQStringToNSArray(NSString * _Nullable arrayStr);
// 拼接接口 queryStr 、token 及 url (queryStr 可以为空)
NSString* _Nullable DZQUrlCommonPara(NSString * __nullable apiCtrl,NSString * __nullable subCtrl,NSString * __nullable queryStr);

@end

