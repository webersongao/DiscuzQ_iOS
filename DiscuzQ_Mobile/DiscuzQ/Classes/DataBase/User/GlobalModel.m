//
//  GlobalModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/15.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "GlobalModel.h"

@implementation GlobalModel

-(void)setCookiepre:(NSString *)cookiepre{
    _cookiepre = cookiepre;
    _authKey = [NSString stringWithFormat:@"%@%@",cookiepre,@"auth"];
}

-(BOOL)isUserLogin{
    if (self.member_uid.length && ![self.member_uid isEqualToString:@"0"] && self.member_username.length) {
        return YES;
    }
    return NO;
}

@end



