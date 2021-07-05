//
//  DZQBaseRelate.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQBaseRelate.h"

@implementation DZQBaseDaModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

@end

@implementation DZQBaseRelate

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [DZQBaseDaModel class]};
}

// 重写 YYModel 类方法 针对性处理 data 类型
//  时而是 NSDictionary 时而是 NSArray 的问题
+(instancetype)relateModelWithJSON:(id)json{
    
    if (![json isKindOfClass:[NSDictionary class]]) {
        // 特殊情况 交给YYModel处理
        return [DZQBaseRelate DZQ_ModelWithJSON:json];
    }
    
    NSMutableDictionary *jsonDict = [NSMutableDictionary dictionaryWithDictionary:json];
    
    id dataObj = [jsonDict objectForKey:@"data"];
    
    if (dataObj) {
        if ([dataObj isKindOfClass:[NSArray class]]) {
//            KSLog(@"WBS data 本身就是 NSArrray");
        }else if ([dataObj isKindOfClass:[NSDictionary class]]){
            NSArray *dataArr = @[dataObj];
            [jsonDict setValue:dataArr forKey:@"data"];
        }
    }
    
    return [DZQBaseRelate DZQ_ModelWithDictionary:jsonDict];
    
}



@end
