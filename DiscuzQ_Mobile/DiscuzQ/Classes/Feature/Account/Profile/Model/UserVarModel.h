//
//  UserVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseVarModel.h"
#import "SpaceModel.h"
#import "BaseResModel.h"

@interface UserVarModel : DZBaseVarModel

@property (nonatomic, strong) SpaceModel *space;  //!< 属性注释
@property (nonatomic, strong) NSDictionary<NSString *,NSDictionary *> *extcredits;  //!< 属性注释

@end



@interface UserResModel : BaseResModel

@property (nonatomic, strong) UserVarModel *Variables;  //!< 属性注释

@end


//@interface DZExtItemModel : NSObject
//
////"img": "",
////"title": "威望",
////"unit": "",
////"ratio": "0",
////"showinthread": null,
////"allowexchangein": null,
////"allowexchangeout": null
//
//@property (nonatomic, copy) NSString *img;  //!< 属性注释
//@property (nonatomic, copy) NSString *title;  //!< 属性注释
//@property (nonatomic, copy) NSString *unit;  //!< 属性注释
//@property (nonatomic, copy) NSString *ratio;  //!< 属性注释
//@property (nonatomic, copy) NSString *showinthread;  //!< 属性注释
//@property (nonatomic, copy) NSString *allowexchangein;  //!< 属性注释
//@property (nonatomic, copy) NSString *allowexchangeout;  //!< 属性注释
//
//
//@end
