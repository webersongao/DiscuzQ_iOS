//
//  DZQResModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResModel.h"

@implementation DZQBodyModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

-(id)DZQDataModel{
    
    
    return nil;
}

@end

@implementation DZQResError

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.status = -1;
        self.errorMsg = @"";
        self.errorDetail = @[];
    }
    return self;
}

+(instancetype)localResError:(DZQErrorModel *)netError json:(id)json{
    
    DZQResError *resError = [[DZQResError alloc] init];
    
    resError.errorMsg = netError.code;
    resError.status = netError ? netError.status : -1;
    
    // 目前仅在 用户注册时出现，因需要弹出detail,用户登录就不需要弹出
    if (netError.status == 422 && [netError.code isEqualToString:@"validation_error"]) {
        KSLog(@"WBS validation_error 特殊处理中...");
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resDict = (NSDictionary *)json;
            NSDictionary *erorDict = [resDict dictionaryForKey:@"errors"];
            resError.errorDetail = [erorDict arrayForKey:@"detail"];
        }
    }else{
        resError.errorDetail = @[DZQStrNull(netError.detail.message)];
    }
    
    return (netError ? resError : nil);
}

@end

@implementation DZQResModel


@end



