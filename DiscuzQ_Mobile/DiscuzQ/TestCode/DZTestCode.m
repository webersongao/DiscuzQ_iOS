//
//  DZTestCode.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/31.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZTestCode.h"
#import <sys/stat.h>

@implementation DZTestCode

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_TestCode];
    }
    return self;
}


-(void)config_TestCode{
    
    //dateFromString方法效率很低，执行一万次方法耗时1100ms，用strptime的C方法替代，一万次耗时300ms
    time_t t;
    struct tm tm;
    NSString *iso8601TimeString = @"2020-7-8";
    strptime([iso8601TimeString cStringUsingEncoding:NSUTF8StringEncoding], "%Y-%m-%dT%H:%M:%S%z", &tm);
    tm.tm_isdst = -1;
    t = mktime(&tm);
    [NSDate dateWithTimeIntervalSince1970:t + [[NSTimeZone localTimeZone] secondsFromGMT]];
    
    
    
    // NSFileManager 的attributesOfItemAtPath方法会取文件所有属性信息，有的可能你根本不需要，这时可以用stat代替NSFileManager，直接获取文件属性：
    struct stat statbuf;
    NSString *filePath = @"/user/desktop/123.txt";
    const char *cpath = [filePath fileSystemRepresentation];
    if (cpath && stat(cpath, &statbuf) == 0) {
        NSNumber *fileSize = [NSNumber numberWithUnsignedLongLong:statbuf.st_size];
        NSDate *modificationDate = [NSDate dateWithTimeIntervalSince1970:statbuf.st_mtime];
        NSDate *creationDate = [NSDate dateWithTimeIntervalSince1970:statbuf.st_ctime];
        // etc
    }
    
    
}

@end
