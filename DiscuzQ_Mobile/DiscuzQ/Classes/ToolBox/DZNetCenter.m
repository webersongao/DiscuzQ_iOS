//
//  DZNetCenter.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter.h"

@implementation DZNetCenter

+ (instancetype)center {
    static DZNetCenter *upTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upTool = [[DZNetCenter alloc] init];
    });
    return upTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.formartQueue = dispatch_queue_create([[NSString stringWithFormat:@"ios_formart_queue.%p", self] UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

@end
