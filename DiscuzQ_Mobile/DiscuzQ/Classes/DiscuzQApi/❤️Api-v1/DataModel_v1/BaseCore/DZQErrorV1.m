//
//  DZQErrorV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/30.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQErrorV1.h"
#import "NSObject+Super.h"

@implementation DZQErrorV1Detail


@end

@implementation DZQErrorV1Source

@end


@implementation DZQErrorV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"source" : [DZQErrorV1Source class]};
}

+(instancetype)super_modelWithDictionary:(NSDictionary *)dictionary{
    
    DZQErrorV1 *errorModel = [DZQErrorV1 DZQ_ModelWithDictionary:dictionary];
    
    id detailObj = [dictionary valueForKey:@"detail"];
    if (!detailObj) {
        errorModel.detail = nil;
    }else{
        if ([detailObj isKindOfClass:[NSArray class]]) {
            errorModel.errorDetailStr = [detailObj componentsJoinedByString:@"|"];
        }else if ([detailObj isKindOfClass:[NSDictionary class]]){
            errorModel.detail = [DZQErrorV1Detail DZQ_ModelWithDictionary:detailObj];
            errorModel.errorDetailStr = errorModel.detail.error_description;
        }
        errorModel.errorDetailStr = [errorModel formartErrorModel:[DZQNetTool shared].formarter.errorDictionary];
    }
    return errorModel;
}

-(NSString *)formartErrorModel:(NSDictionary *)errorDictionary{
    
    NSString *detailStr = [errorDictionary objectForKey:self.code];
    
    if (detailStr.length && self.errorDetailStr.length) {
        detailStr = [self.errorDetailStr stringByAppendingString:checkStr(detailStr)];
    }
    
    return detailStr;
}

@end


@implementation DZQResBodyV1

+(DZQResBodyV1 *)ResErrorsWithDict:(NSDictionary *)resErrorDict {
    
    DZQResBodyV1 *resError = [[DZQResBodyV1 alloc] init];
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    id errorObj = [resErrorDict valueForKey:@"errors"];
    NSMutableArray *errorMuArray = [NSMutableArray array];
    if ([errorObj isKindOfClass:[NSArray class]]) {
        [errorMuArray addObjectsFromArray:errorObj];
    }else if ([errorObj isKindOfClass:[NSDictionary class]]){
        [errorMuArray addObject:errorObj];
    }
    for (NSDictionary *innerDict in errorMuArray) {
        DZQErrorV1 *model = [DZQErrorV1 super_modelWithDictionary:innerDict];
        [mutableArray addObject:model];
    }
    resError.errors = mutableArray.copy;
    
    return resError;
}

@end

