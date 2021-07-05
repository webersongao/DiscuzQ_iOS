//
//  DZSiteSubV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DZSite_manage : NSObject

@property (nonatomic, assign) BOOL value;  //!< 属性注释
@property (nonatomic, assign) NSInteger key;  //!< 属性注释
@property (nonatomic, copy) NSString *desc;  //!< 属性注释

@end

@interface DZSite_author : NSObject

@property (nonatomic, copy) NSString *userid;  //!< 属性注释
@property (nonatomic, copy) NSString *username;  //!< 属性注释
@property (nonatomic, copy) NSString *avatar;  //!< 属性注释

@end

@interface DZSite_pivot : NSObject

@property (nonatomic, assign) NSInteger user_id;  //!< 属性注释
@property (nonatomic, assign) NSInteger group_id;  //!< 属性注释
@property (nonatomic, copy) NSString *expiration_time;  //!< 属性注释

@end

@interface DZSite_group : NSObject

@property (nonatomic, copy) NSString *groupId;  //!< 属性注释
@property (nonatomic, copy) NSString *name;  //!< 属性注释
@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *color;  //!< 颜色
@property (nonatomic, copy) NSString *icon;  //!< 用户组图标
@property (nonatomic, assign) BOOL isDefault;  //!< 是否为默认用户组

@property (nonatomic, assign) BOOL is_display;  //!< 是否显示在用户名后
@property (nonatomic, assign) BOOL is_paid;  //!< 是否收费：0 不收费，1 收费

@property (nonatomic, assign) double fee;  //!< 收费金额
@property (nonatomic, assign) NSInteger days;  //!< 付费获得天数
@property (nonatomic, assign) NSInteger scale;  //!< 属性注释
@property (nonatomic, assign) BOOL is_subordinate;  //!< 属性注释
@property (nonatomic, assign) BOOL is_commission;  //!< 属性注释
@property (nonatomic, strong) DZSite_pivot *pivot;  //!< 属性注释

@end


