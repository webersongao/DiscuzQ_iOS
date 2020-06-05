//
//  BaseUser.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/10.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseUser : NSObject

@property (nonatomic, copy) NSString *uid;  //!< 属性注释
@property (nonatomic, copy) NSString *email;  //!< 属性注释
@property (nonatomic, copy) NSString *username;  //!< 属性注释
@property (nonatomic, copy) NSString *password;  //!< 属性注释
@property (nonatomic, copy) NSString *avatar;  //!< 属性注释
@property (nonatomic, copy) NSString *status;  //!< 属性注释
@property (nonatomic, copy) NSString *emailstatus;  //!< 属性注释
@property (nonatomic, copy) NSString *avatarstatus;  //!< 属性注释
@property (nonatomic, copy) NSString *videophotostatus;  //!< 属性注释
@property (nonatomic, copy) NSString *adminid;  //!< 属性注释
@property (nonatomic, copy) NSString *groupid;  //!< 属性注释
@property (nonatomic, copy) NSString *groupexpiry;  //!< 属性注释
@property (nonatomic, copy) NSString *extgroupids;  //!< 属性注释
@property (nonatomic, copy) NSString *regdate;  //!< 注册时间 // 1573148340
@property (nonatomic, copy) NSString *credits;  //!< 属性注释
@property (nonatomic, copy) NSString *notifysound;  //!< 属性注释
@property (nonatomic, copy) NSString *timeoffset;  //!< 属性注释
@property (nonatomic, copy) NSString *newpm;  //!< 属性注释
@property (nonatomic, copy) NSString *newprompt;  //!< 属性注释
@property (nonatomic, copy) NSString *accessmasks;  //!< 属性注释
@property (nonatomic, copy) NSString *allowadmincp;  //!< 属性注释
@property (nonatomic, copy) NSString *onlyacceptfriendpm;  //!< 属性注释
@property (nonatomic, copy) NSString *conisbind;  //!< 属性注释
@property (nonatomic, copy) NSString *freeze;  //!< 属性注释




@end


