//
//  DZInstance.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZInstance.h"

@implementation DZInstance

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config_localInstance];
    }
    return self;
}


-(void)config_localInstance{
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    
    
}

@end
