//
//  DZQNetTool+Category.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQNetTool.h"
#import "DZQCateModel.h"
#import "DZQResModel.h"
#import "DZQThreadRelationModel.h"

@interface DZQNetTool (Category)

/// 获取 内容分类 列表
-(void)dz_categoryListWithSuccess:(PRCompleteBlock)success failure:(PRFailureBlock)failure;



@end


