//
//  DZQDataLogic+Convert_V1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic+Convert_V1.h"

@implementation DZQDataLogic (Convert_V1)

-(DZQResV1 *)revert_innerResConvertWithJSON:(id)json urlCtrl:(NSString *)urlCtrl{
    
    DZQOriginResV1 * res_formartModel = [DZQOriginResV1 resBaseModelWithJSON:json];
    
    // 开启内部模型转换（先 included 后 data）
    
    // 1、整理 included.relationships为标准单层级字典
    
    //    NSArray<NSDictionary *> *includedModel = res_formartModel.included;
    NSMutableArray *resModel_included = [NSMutableArray array];
    for (NSDictionary *incModel in res_formartModel.included) {
        
        NSMutableDictionary *muIncModel = [NSMutableDictionary dictionaryWithDictionary:incModel];
        
        NSDictionary *incRelationDict = [incModel dictionaryForKey:@"relationships"];
        NSDictionary * included_relationships_formartDict = [self one_innerConvert:res_formartModel.included incRelationDict:incRelationDict];
        
        // 格式化 的dict 赋值给 included.relationships
        //        incModel.relationships = included_relationships_formartDict;
        [muIncModel setValue:included_relationships_formartDict forKey:@"relationships"];
        
        if (muIncModel && muIncModel.allKeys.count) {
            [resModel_included addObject:muIncModel];
        }
        KSLog(@"");
    }
    
    // result： 此刻的 includedModel 也就是 resModel.included 内部都是单层级的 dictionary
    res_formartModel.included = resModel_included;
    
    // 2、整理 data.relationships为标准单层级字典
    //    NSArray<NSDictionary *> *dataModel = res_formartModel.data;
    NSMutableArray *resModel_Data = [NSMutableArray array];
    for (NSDictionary *dataModel in res_formartModel.data) {
        
        NSMutableDictionary *muDataModel = [NSMutableDictionary dictionaryWithDictionary:dataModel];
        
        NSDictionary * incRelationDict = [dataModel dictionaryForKey:@"relationships"];
        
        NSDictionary * data_relationships_formartDict = [self one_innerConvert:res_formartModel.included incRelationDict:incRelationDict];
        
        //        dataModel.relationships = data_relationships_formartDict;
        [muDataModel setValue:data_relationships_formartDict forKey:@"relationships"];
        
        if (muDataModel && muDataModel.allKeys.count) {
            [resModel_Data addObject:muDataModel];
        }
    }
    
    // result： 此刻的 dataModel 也就是 resModel.data 内部都是单层级的 dictionary 数组
    res_formartModel.data = resModel_Data;
    
    // 3、将格式化后的复合型字典 转化为 嵌套model
    DZQResV1 *resModel = [DZQResV1 revert_convertWithOriRes:res_formartModel oriJSON:json urlCtrl:urlCtrl dataMaper:self.Maper];
    
    return resModel;
}


-(NSDictionary *)one_innerConvert:(NSArray<NSDictionary *> *)resModel_included incRelationDict:(NSDictionary *)incRelationDict{
    
    if (!incRelationDict.allKeys.count) {
        return nil;
    }
    
    NSMutableDictionary * incRelationformartDict = [NSMutableDictionary dictionary];
    
    for (NSString *keyStr in incRelationDict.allKeys) {
        
        NSDictionary *innnerDatad = [incRelationDict objectForKey:keyStr];
        id innnerDataValue = [innnerDatad objectForKey:@"data"];
        
        if ([innnerDataValue isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *dictArray = [NSMutableArray array];
            
            for (NSDictionary *dict in innnerDataValue) {
                DZQBaseDaModel *daModel = [DZQBaseDaModel DZQ_ModelWithDictionary:dict];
                NSDictionary *innerAttributesDict = [self two_innerConvert:resModel_included daModel:daModel];
                
                if (innerAttributesDict && innerAttributesDict.allKeys.count) {
                    [dictArray addObject:innerAttributesDict];
                }
            }
            
            [incRelationformartDict setValue:dictArray forKey:keyStr];
            
        }else if ([innnerDataValue isKindOfClass:[NSDictionary class]]){
            
            DZQBaseDaModel *daModel = [DZQBaseDaModel DZQ_ModelWithDictionary:innnerDataValue];
            NSDictionary *innerAttributesDict = [self two_innerConvert:resModel_included daModel:daModel];
            
            [incRelationformartDict setValue:innerAttributesDict forKey:keyStr];
            
        }else{
            KSLog(@"");
        }
        
    }
    
    NSDictionary *resultDict = incRelationformartDict.allKeys.count ? incRelationformartDict : nil;
    
    return resultDict;
}

-(NSDictionary *)two_innerConvert:(NSArray<NSDictionary *> *)resModel_included daModel:(DZQBaseDaModel *)daModel{
    
    NSDictionary *relationInnerValueDict = nil;
    
    if (daModel && daModel.type.length && daModel.inner_id.length ) {
        
        for (NSDictionary *incModel in resModel_included) {
            
            NSString *inc_id = [incModel stringForKey:@"id"];
            NSString *inc_type = [incModel stringForKey:@"type"];
            
            if ([inc_type isEqualToString:daModel.type] && [inc_id isEqualToString:daModel.inner_id]) {
                
                relationInnerValueDict = incModel;
                
                break;
            }
        }
    }else{
        KSLog(@"");
    }
    
    return relationInnerValueDict;
}




@end
