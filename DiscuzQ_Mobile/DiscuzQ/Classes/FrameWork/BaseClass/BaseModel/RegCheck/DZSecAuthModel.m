//
//  DZSecAuthModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/9.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZSecAuthModel.h"

@implementation DZSecAuthModel

-(void)setSecqaa:(NSString *)secqaa{
    _secqaa = checkNull(secqaa);
}

-(void)setSeccode:(NSString *)seccode{
    _seccode = checkNull(seccode);
}
-(void)setSechash:(NSString *)sechash{
    _sechash = checkNull(sechash);
}

@end
