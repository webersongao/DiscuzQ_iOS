//
//  DZSkinHelper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSkinHelper.h"

@interface DZSkinHelper ()

@end


@implementation DZSkinHelper

+ (instancetype)sharedHelper {
    static DZSkinHelper *upTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upTool = [[DZSkinHelper alloc] init];
    });
    return upTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bNight = NO;
    }
    return self;
}

- (NSString*)getGrayDarkTitleColorString
{
    return [self getGrayDarkTitleColorString:self.bNight];
}

- (NSString*)getGrayDarkTitleColorString:(BOOL)bNight
{
    if (bNight)
    {
        return @"cccccc";
    }
    else
    {
        return @"7a573c";//@"161616";
    }
}
- (NSString*)getGrayLightTitleColorString
{
    return @"ab917c";//@"787878";
}

@end
