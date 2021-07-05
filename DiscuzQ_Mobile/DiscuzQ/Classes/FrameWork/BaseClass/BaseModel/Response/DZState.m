//
//  DZState.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZState.h"

@implementation DZState


+(instancetype)initState:(BOOL)isSuccess code:(DZStateCode)code desc:(NSString *)desc{
    
    DZState *state = [[DZState alloc] init];
    state.code = code;
    state.stateDesc = desc;
    state.success = isSuccess;
    return state;
}

@end
