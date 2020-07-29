//
//  DZBaseAuthModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/6.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseVarModel.h"
#import "DZThreadProperty.h"
#import "ForumModel.h"

@interface DZBaseAuthModel : DZBaseVarModel

@property (nonatomic, strong) DZThreadPermModel *allowperm;  //!< 属性注释
@property (nonatomic, strong) ForumModel *forum;  //!< 属性注释
@property (nonatomic, strong) DZThreadTypesModel *threadtypes;  //!< 属性注释
@property (nonatomic, strong) DZActivitySetModel *activity_setting;  //!< 属性注释

@end


