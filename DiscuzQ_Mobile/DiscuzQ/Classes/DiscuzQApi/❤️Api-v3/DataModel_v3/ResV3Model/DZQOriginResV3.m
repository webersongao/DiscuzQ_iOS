//
//  DZQOriginResV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQOriginResV3.h"

@implementation DZQOriginResV3

+(instancetype)resV3BaseModelWithJSON:(id)json{
    
    if (![json isKindOfClass:[NSDictionary class]]) {
        // 特殊情况 交给YYModel处理
        return [DZQOriginResV3 DZQ_ModelWithJSON:json];
    }
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithDictionary:json];;
    id dataObj = [jsonDict objectForKey:@"Data"];
    
    if (dataObj) {
        if ([dataObj isKindOfClass:[NSArray class]]) {
            // KSLog(@"WBS data 本身就是 NSArrray");
            for (id obj in dataObj) {
                if (![obj isKindOfClass:[NSDictionary class]]) {
                    [jsonDict setValue:@(YES) forKey:@"localError"];
                }
            }
        }else if ([dataObj isKindOfClass:[NSDictionary class]]){
            NSArray *dataArr = @[dataObj];
            [jsonDict setValue:dataArr forKey:@"Data"];
        }
    }
    
    return [DZQOriginResV3 DZQ_ModelWithDictionary:jsonDict];
}

@end
