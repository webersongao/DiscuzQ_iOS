//
//  DZQResV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV1.h"
#import "DZQMaper.h"
#import "NSObject+Super.h"

@implementation DZQBodyV1

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

@end

@implementation DZQResError


+(DZQResError *)errorBodyWithError:(PRError *)oriError {
    
    DZQResError *body = [[DZQResError alloc] init];
    body.ori_error = oriError.error;
    NSDictionary *resDict = body.ori_errorRes = oriError.resDictionary;
    body.errorBody = [DZQResBodyV1 ResErrorsWithDict:resDict];
    
    return body;
}

@end


#pragma mark   /*************** 请求返回模型 ***************/

@interface DZQResV1 ()

@property (nonatomic, strong) NSArray<DZQBodyV1 *> *dataBody;  //!< 核心模型化数据
// 请求失败 错误信息
@property (nonatomic, strong) DZQResError *errorBody;  //!< 核心模型化数据
@property (nonatomic, strong) DZQOriginResV1 *oriRes_formart;  //!< 网络返回的原始数据（已经格式化过了）
@property (nonatomic, strong) NSDictionary *oriRes_dictionary;  //!< 网络返回的原始数据（没有格式化）

@end


@implementation DZQResV1


+(DZQResV1 *)revert_convertWithOriRes:(DZQOriginResV1 *)res_formartModel oriJSON:(id)json urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper{

    
    // 1、将格式化后的复合型字典 转化为 嵌套model
    DZQResV1 *resModel = [[DZQResV1 alloc] init];
    resModel.oriRes_formart = res_formartModel;
    resModel.oriRes_dictionary = [json isKindOfClass:[NSDictionary class]] ? json : nil;
    resModel.dataBody = [DZQResV1 three_innerConvertWithJSON:res_formartModel.data urlCtrl:urlCtrl dataMaper:dataMaper];
    
    // 2、处理 布局对象(附加的 UI布局逻辑，跟数据本身无关)
    [[dataMaper dataConvertForKey:urlCtrl] convertResponseDataBody:resModel.dataBody];
    
    
    // 3、给出最后的 数据判定结果
    [resModel setResSuccess:((!resModel || !json) ? NO : YES)];
    [resModel setResHasMore:(resModel.success && res_formartModel.links.next.length)];
    
    return resModel;
}



//#pragma mark   /*************** 最后的模型转换 ***************/

+(NSArray *)three_innerConvertWithJSON:(NSArray<NSDictionary *> *)resModel_data urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper{
    
    // 开启内部模型转换
    NSMutableArray *localBodyArray = [NSMutableArray array];
    for (NSDictionary *dataModel in resModel_data) {
        
        DZQBodyV1 *bodyModel = [[DZQBodyV1 alloc] init];
        
        // 1、处理 id 及 type
        bodyModel.type = [dataModel stringForKey:@"type"];
        bodyModel.inner_id = [dataModel stringForKey:@"id"];
        
        // 2、处理 attributes
        {
            NSString *data_type = [dataModel stringForKey:@"type"];
            Class attributeClass = [dataMaper modelClassForKey:data_type];
            if (!attributeClass) { KSLog(@"WBS %@ 接口 attributes 模型未实现 该项数据丢弃",urlCtrl); continue; }
            
            NSDictionary *data_attributes = [dataModel dictionaryForKey:@"attributes"];
            bodyModel.attributes = [attributeClass DZQ_ModelWithDictionary:data_attributes];
        }
        
        // 3、处理 relationships
        {
            Class relateClass = [dataMaper relationClassForUrlKey:urlCtrl];
            if (!relateClass) { KSLog(@"WBS %@ 接口 relationships 模型未实现",urlCtrl); relateClass = nil; }
            
            NSDictionary *data_relationships = [dataModel dictionaryForKey:@"relationships"];
            bodyModel.relationships = [relateClass super_modelWithDictionary:data_relationships];
        }
        
        // 回归合并到数组
        [localBodyArray addObject:bodyModel];
    }
    
    return localBodyArray;
}

@end









