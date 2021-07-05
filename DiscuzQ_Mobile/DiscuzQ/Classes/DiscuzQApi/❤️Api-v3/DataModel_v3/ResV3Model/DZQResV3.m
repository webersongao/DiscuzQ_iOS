//
//  DZQResV3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQResV3.h"

@implementation DZQBodyV3

@end

@interface DZQResV3 ()

@property (nonatomic, assign) NSInteger resCode;  //!< 属性注释
@property (nonatomic, copy) NSString *resMessage;  //!< 属性注释
@property (nonatomic, strong) NSArray<DZQBodyV3 *> *resData;  //!< 属性注释
@property (nonatomic, copy) NSString *resRequestId;  //!< 属性注释
@property (nonatomic, copy) NSString *resRequestTime;  //!< 属性注释

@end

@implementation DZQResV3

+(DZQResV3 *)revert_V3ConvertWithOriRes:(DZQOriginResV3 *)res_formartModel oriJSON:(id)json modelClass:(Class)modelClass{
    
    DZQResV3 *resModel = [[DZQResV3 alloc] init];
    
    NSMutableArray *dataMArray = [NSMutableArray array];
    for (NSDictionary *dictionary in res_formartModel.Data) {
        DZQBodyV3 *bodyV3 = [modelClass DZQ_ModelWithDictionary:dictionary];
        if (bodyV3) {[dataMArray addObject:bodyV3];}
    }
    resModel.resData = dataMArray.copy;
    
    resModel.resCode = res_formartModel.Code;
    resModel.resMessage = res_formartModel.Message;
    resModel.resRequestId = res_formartModel.RequestId;
    resModel.resRequestTime = res_formartModel.RequestTime;
    
    [resModel setResSuccess:(resModel.resData.count && resModel.resCode == 0 && !res_formartModel.localError)];
    
    return resModel;
}



+(NSArray *)three_innerV3ConvertWithJSON:(NSArray<NSDictionary *> *)resModel_data urlCtrl:(NSString *)urlCtrl dataMaper:(DZQMaper *)dataMaper{
    
    return nil;
}




@end
