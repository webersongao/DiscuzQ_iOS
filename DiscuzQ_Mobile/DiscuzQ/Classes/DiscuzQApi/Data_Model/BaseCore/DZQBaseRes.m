//
//  DZUserResModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseRes.h"

@implementation DZQBaseRes

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"links" : [DZQLinkModel class],
             @"meta" : [DZQMetaModel class],
             @"errors" : [DZQErrorModel class]
    };
}


 // 重写 YYModel 类方法 针对性处理 data 类型
 //  时而是 NSDictionary 时而是 NSArray 的问题
+(instancetype)resBaseModelWithJSON:(id)json{

    if (![json isKindOfClass:[NSDictionary class]]) {
        // 特殊情况 交给YYModel处理
        return [DZQBaseRes yy_modelWithJSON:json];
    }
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithDictionary:json];;
    id dataObj = [jsonDict objectForKey:@"data"];
    id errorObj = [jsonDict objectForKey:@"errors"];

    if (dataObj) {
        if ([dataObj isKindOfClass:[NSArray class]]) {
//            KSLog(@"WBS data 本身就是 NSArrray");
        }else if ([dataObj isKindOfClass:[NSDictionary class]]){
            NSArray *dataArr = @[dataObj];
            [jsonDict setValue:dataArr forKey:@"data"];
        }
    }

    if (errorObj) {
        if ([errorObj isKindOfClass:[NSArray class]]) {
//            KSLog(@"WBS error 本身就是 NSArrray");
        }else if ([errorObj isKindOfClass:[NSDictionary class]]){
            NSArray *errorArr = @[errorObj];
            [jsonDict setValue:errorArr forKey:@"errors"];
        }
    }

    return [DZQBaseRes yy_modelWithDictionary:jsonDict];
}


@end
