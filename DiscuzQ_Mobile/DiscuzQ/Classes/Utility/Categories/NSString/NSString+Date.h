//
//  NSString+Date.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    unAccurate,     // (常用)不精确 -  几天前 几小时前 几分钟前 刚刚
    halfAccurate,   // 半精确 - 2020-05-25 --> 09:23 --> 23:08 --> 09:23:08
    fullAccurate,    // 精确 - 2020-05-25 09:23:08
    ymdAccurate,    // 2020-05-25
}AccurateType;

@interface NSString (Date)

-(NSString *)dateFormatWithAccurate:(AccurateType)accurateType;



@end


