//
//  PRError.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "PRError.h"

@interface PRError ()

@property (nonatomic, strong) NSError *error;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *resDictionary;  //!< 属性注释

@end

@implementation PRError

+(instancetype)PRRrror:(NSError *)error{
    
    PRError *localError = [[PRError alloc]init];
    localError.resDictionary = nil;
    localError.error = error;
    
    return localError;
}

+(instancetype)PRRrror:(NSError *)error response:(id)responseObj{
    
    PRError *localError = [[PRError alloc]init];
    localError.resDictionary = [responseObj isKindOfClass:[NSDictionary class]] ? responseObj : nil;
    localError.error = error;
    
    return localError;
}

@end
