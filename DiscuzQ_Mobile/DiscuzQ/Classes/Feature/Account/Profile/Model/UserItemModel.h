//
//  UserItemModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AdmingroupModel : NSObject

//"admingroup": {
//    "type": "system",
//    "grouptitle": "管理员",
//    "stars": "9",
//    "color": "",
//    "icon": "",
//    "readaccess": "200",
//    "allowgetattach": "1",
//    "allowgetimage": "1",
//    "allowmediacode": "1",
//    "maxsigsize": "500",
//    "allowbegincode": "1",
//    "userstatusby": "1"
//},

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *grouptitle;  //!< 属性注释
@property (nonatomic, copy) NSString *stars;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 属性注释
@property (nonatomic, copy) NSString *icon;  //!< 属性注释
@property (nonatomic, copy) NSString *readaccess;  //!< 属性注释
@property (nonatomic, copy) NSString *allowgetattach;  //!< 属性注释
@property (nonatomic, copy) NSString *allowgetimage;  //!< 属性注释
@property (nonatomic, copy) NSString *allowmediacode;  //!< 属性注释
@property (nonatomic, copy) NSString *maxsigsize;  //!< 属性注释
@property (nonatomic, copy) NSString *allowbegincode;  //!< 属性注释
@property (nonatomic, copy) NSString *userstatusby;  //!< 属性注释


@end

@interface UserGroupModel : NSObject

//"group": {
//    "type": "system",
//    "grouptitle": "管理员",
//    "stars": "9",
//    "color": "",
//    "icon": "",
//    "readaccess": "200",
//    "allowgetattach": "1",
//    "allowgetimage": "1",
//    "allowmediacode": "1",
//    "maxsigsize": "500",
//    "allowbegincode": "1",
//    "userstatusby": "1"
//},
@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *grouptitle;  //!< 属性注释
@property (nonatomic, copy) NSString *stars;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 属性注释
@property (nonatomic, copy) NSString *icon;  //!< 属性注释
@property (nonatomic, copy) NSString *readaccess;  //!< 属性注释
@property (nonatomic, copy) NSString *allowgetattach;  //!< 属性注释
@property (nonatomic, copy) NSString *allowgetimage;  //!< 属性注释
@property (nonatomic, copy) NSString *allowmediacode;  //!< 属性注释
@property (nonatomic, copy) NSString *maxsigsize;  //!< 属性注释
@property (nonatomic, copy) NSString *allowbegincode;  //!< 属性注释
@property (nonatomic, copy) NSString *userstatusby;  //!< 属性注释

@end



