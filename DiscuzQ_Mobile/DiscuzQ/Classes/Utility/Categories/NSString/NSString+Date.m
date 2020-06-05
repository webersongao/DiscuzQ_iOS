//
//  NSString+Date.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "NSString+Date.h"
#import "NSDate+Additions.h"


@implementation NSString (Date)

-(NSString *)dateFormatWithAccurate:(AccurateType)accurateType{
    
    if (self == nil || self.length == 0) {
        return @"";
    }
    
    NSDate *datenow = [NSDate date];
    NSDateFormatter * dateFormatter = [self formatter];
    NSDateFormatter * dateFormatter_Beijing = [self formatter_Beijing];
    NSDate * newdate = [dateFormatter_Beijing dateFromString:self];
    
    NSString *timeString= @"";
    
    CGFloat dd = (CGFloat)[datenow timeIntervalSince1970] - [newdate timeIntervalSince1970];
    if (accurateType == fullAccurate) {
        [dateFormatter setDateFormat:@"YYYY.MM.dd HH:mm"];
        timeString = [dateFormatter stringFromDate:newdate];
    } else if (accurateType == ymdAccurate) {
        [dateFormatter setDateFormat:@"yyyy.MM.dd"];
        timeString = [dateFormatter stringFromDate:newdate];
    } else{
        
        if (dd/(60*60*24) > 1) {
            // 大于1天
            if (accurateType == unAccurate) {
                if (dd/(60*60*24*7)<=1) {
                    // 小于一周
                    timeString = [NSString stringWithFormat:@"%d天前", (int)dd/(60*60*24)];
                }else if ((dd/(60*60*24*30)) <= 6){
                    // 半年 180天 以内
                    [dateFormatter setDateFormat:@"MM-dd"];
                    timeString = [dateFormatter stringFromDate:newdate];
                }else{
                    
                    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
                    timeString = [dateFormatter stringFromDate:newdate];
                }
            }else{
                
                if ([datenow isSameYearAsDate:newdate]) {
                    [dateFormatter setDateFormat:@"MM.dd HH:mm"];
                    timeString = [dateFormatter stringFromDate:newdate];
                }else{
                    [dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm"];
                    timeString = [dateFormatter stringFromDate:newdate];
                }
            }
            
        }else{
            
            if (dd/(60*60)>1 && dd/(60*60*24)<1){
                // 大于1小时，但小于一天
                if (accurateType == unAccurate) {
                    timeString=[NSString stringWithFormat:@"%d小时前", (int)dd/(60*60)];
                }else{
                    [dateFormatter setDateFormat:@"HH:mm"];
                    timeString = [dateFormatter stringFromDate:newdate];
                }
            }
            
            if (dd/60 > 1 && dd/(60*60)<1){
                // 一小时以内
                timeString=[NSString stringWithFormat:@"%d分钟前", (int)dd/60];
            }
            
            if (dd/60 < 1.0f) {
                // 一分钟以内
                timeString=[NSString stringWithFormat:@"刚刚"];
            }
        }
        
    }
    
    return timeString;
}

// UTC 标准时 2020-05-25T09:23:08+08:00
-(NSDateFormatter*)formatter_Beijing{
    NSDateFormatter *formatter = [DZMobileCtrl sharedCtrl].instance.dateFormatter;
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Beijing"]];
    return formatter;
}

-(NSDateFormatter*)formatter{
    NSDateFormatter *formatter = [DZMobileCtrl sharedCtrl].instance.dateFormatter;
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    return formatter;
}


@end
