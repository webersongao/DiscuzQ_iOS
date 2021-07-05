//
//  DZQDataLogic+Convert_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQDataLogic (Convert_V1)

-(DZQResV1 *)revert_innerResConvertWithJSON:(id)json urlCtrl:(NSString *)urlCtrl;

-(NSDictionary *)one_innerConvert:(NSArray<NSDictionary *> *)resModel_included incRelationDict:(NSDictionary *)incRelationDict;

-(NSDictionary *)two_innerConvert:(NSArray<NSDictionary *> *)resModel_included daModel:(DZQBaseDaModel *)daModel;

@end

NS_ASSUME_NONNULL_END
