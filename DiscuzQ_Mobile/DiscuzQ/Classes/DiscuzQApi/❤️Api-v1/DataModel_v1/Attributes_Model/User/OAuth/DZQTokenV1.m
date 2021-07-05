//
//  DZQTokenV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTokenV1.h"

@implementation DZQTokenV1

-(void)setExpires_in:(NSTimeInterval)expires_in{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    if (expires_in > time) {
        _expires_in = expires_in;
    }else{
        _expires_in = expires_in + time;
    }
}

-(BOOL)isExpired{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    if (self.token_type.length && self.access_token.length && self.expires_in >= time) {
        return NO;
    }
    return YES;
}


@end
