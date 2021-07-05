//
//  DZQNetTool+Category_V1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQCateV1.h"
#import "DZQThreadRelationV1.h"

@interface DZQNetTool (Category_V1)

/// 获取 内容分类 列表
-(void)DZQ_V1_CategoryListWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


