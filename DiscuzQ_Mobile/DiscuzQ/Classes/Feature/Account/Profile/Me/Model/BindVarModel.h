//
//  BindVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "GlobalModel.h"


@interface BindUser: NSObject

//"uid": "1",
//"openid": "",
//"status": "0",
//"session_key": "",
//"type": "weixin"

@property (nonatomic, strong) NSString *uid;  //!< 属性注释
@property (nonatomic, strong) NSString *openid;  //!< 属性注释
@property (nonatomic, strong) NSString *status;  //!< 属性注释
@property (nonatomic, strong) NSString *type;  //!< 属性注释
@property (nonatomic, strong) NSString *session_key;  //!< 属性注释

// 自定义属性
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

@end

@interface BindVarModel : GlobalModel

@property (nonatomic, strong) NSArray<BindUser *> *users;  //!< 属性注释

@end


