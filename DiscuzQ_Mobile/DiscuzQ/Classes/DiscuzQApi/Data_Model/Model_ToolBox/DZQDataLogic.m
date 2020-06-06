//
//  DZQDataLogic.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic.h"

@interface DZQDataLogic ()

@property (nonatomic, strong) dispatch_queue_t dataQueue;  //!< 数据处理Queue
@property (nonatomic, strong) NSFileManager *fileManager;  //!< 属性注释
@end

@implementation DZQDataLogic

- (instancetype)init
{
    self = [super init];
    if (self) {
        _Maper = [[DZQMaper alloc] init];
        _fileManager = [NSFileManager defaultManager];
        
        self.dataQueue = dispatch_queue_create([[NSString stringWithFormat:@"ios_sdk_queueManager.%p", self] UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)cleanCacheWithBlock:(void (^)(void))completion{
    
    NSString *cachePath = [self localDataPathWithUrl:nil];
    [self.fileManager removeItemAtPath:cachePath error:nil];
    if (completion) { completion(); }
}

-(NSDictionary *)loadResponseDataWithUrl:(NSString *)urlString{
    
    NSString *cachePath = [self localDataPathWithUrl:urlString];
    
    return [NSDictionary dictionaryWithContentsOfFile:cachePath];
    
}

-(void)saveResponseDataWithUrl:(NSString *)urlString resData:(NSDictionary *)resData{
    
    NSString *cachePath = [self localDataPathWithUrl:urlString];
    
    [resData writeToFile:cachePath atomically:YES];
}

-(void)resModelWithJSON:(id)json urlCtrl:(NSString *)urlCtrl completion:(void (^)(DZQResModel *resModel))completion{
    
    dispatch_async(self.dataQueue, ^{
        
        DZQResModel *resModel = [self revert_innerResConvertWithJSON:json urlCtrl:urlCtrl];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(resModel);
            }
        });
    });
}

-(DZQResModel *)revert_innerResConvertWithJSON:(id)json urlCtrl:(NSString *)urlCtrl{
    
    DZQBaseRes * res_formartModel = [DZQBaseRes resBaseModelWithJSON:json];
    
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
        
        KSLog(@"");
    }
    
    // result： 此刻的 dataModel 也就是 resModel.data 内部都是单层级的 dictionary 数组
    res_formartModel.data = resModel_Data;
    
    // 3、将格式化后的复合型字典 转化为 嵌套model
    DZQResModel *resModel = [[DZQResModel alloc] init];
    resModel.oriRes_formart = res_formartModel;
    resModel.oriRes_dictionary = [json isKindOfClass:[NSDictionary class]] ? json : nil;
    NSArray *localDataBody = resModel.dataBody = [self three_innerConvertWithJSON:res_formartModel.data urlCtrl:urlCtrl];
    
    // 4、处理 特殊error validation_error
    resModel.resError = [DZQResError localResError:res_formartModel.errors.firstObject json:json];
    
    // 5、处理 布局对象
    DZQDataConvert *dataConvert = [self.Maper dataConvertForKey:urlCtrl];
    [dataConvert convertResponseDataBody:localDataBody];
    
    
    // 6、给出最后的 数据判定结果
    resModel.success = (!resModel || resModel.resError.status > 0) ? NO : YES;
    resModel.hasMore = (resModel.success && res_formartModel.links.next.length) ? YES : NO;
    
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
                DZQBaseDaModel *daModel = [DZQBaseDaModel yy_modelWithDictionary:dict];
                NSDictionary *innerAttributesDict = [self two_innerConvert:resModel_included daModel:daModel];
                
                if (innerAttributesDict && innerAttributesDict.allKeys.count) {
                    [dictArray addObject:innerAttributesDict];
                }
            }
            
            [incRelationformartDict setValue:dictArray forKey:keyStr];
            
        }else if ([innnerDataValue isKindOfClass:[NSDictionary class]]){
            
            DZQBaseDaModel *daModel = [DZQBaseDaModel yy_modelWithDictionary:innnerDataValue];
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
    
    if (daModel && daModel.type.length && daModel.type_id.length ) {
        
        for (NSDictionary *incModel in resModel_included) {
            
            NSString *inc_id = [incModel stringForKey:@"id"];
            NSString *inc_type = [incModel stringForKey:@"type"];
            
            if ([inc_type isEqualToString:daModel.type] && [inc_id isEqualToString:daModel.type_id]) {
                
                relationInnerValueDict = incModel;
                
                break;
            }
        }
    }else{
        KSLog(@"");
    }
    
    return relationInnerValueDict;
}

-(NSArray *)three_innerConvertWithJSON:(NSArray<NSDictionary *> *)resModel_data urlCtrl:(NSString *)urlCtrl{
    
    // 开启内部模型转换
    NSMutableArray *localBodyArray = [NSMutableArray array];
    for (NSDictionary *dataModel in resModel_data) {
        
        DZQBodyModel *bodyModel = [[DZQBodyModel alloc] init];
        
        // 1、处理 id 及 type
        bodyModel.type = [dataModel stringForKey:@"type"];
        bodyModel.type_id = [dataModel stringForKey:@"id"];
        
        // 2、处理 attributes
        {
            NSString *data_type = [dataModel stringForKey:@"type"];
            Class attributeClass = [self.Maper modelClassForKey:data_type];
            if (!attributeClass) { KSLog(@"WBS %@ 接口 attributes 模型未实现 该项数据丢弃",urlCtrl); continue; }
            
            NSDictionary *data_attributes = [dataModel dictionaryForKey:@"attributes"];
            bodyModel.attributes = [attributeClass yy_modelWithDictionary:data_attributes];
        }
        
        // 3、处理 relationships
        {
            Class relateClass = [self.Maper relationClassForUrlKey:urlCtrl];
            if (!relateClass) { KSLog(@"WBS %@ 接口 relationships 模型未实现",urlCtrl); relateClass = nil; }
            
            NSDictionary *data_relationships = [dataModel dictionaryForKey:@"relationships"];
            bodyModel.relationships = [relateClass dz_modelWithDictionary:data_relationships];
        }
        
        // 回归合并到数组
        [localBodyArray addObject:bodyModel];
    }
    
    return localBodyArray;
}



-(NSString *)localDataPathWithUrl:(NSString *)urlString{
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *folderPath = [cachePath stringByAppendingPathComponent:@"SDKLogic/"];
    
    if (![self.fileManager fileExistsAtPath:folderPath]) {
        [self.fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"SDKLogic/%@.plist",[urlString md5String]]];
}





@end
