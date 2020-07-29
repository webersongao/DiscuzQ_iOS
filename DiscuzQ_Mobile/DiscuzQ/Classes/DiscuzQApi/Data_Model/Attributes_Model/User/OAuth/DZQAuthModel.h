//
//  DZQAuthModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQAuthModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *username;  //!< 用户名
@property (nonatomic, copy) NSString *nickname;  //!< 昵称
@property (nonatomic, copy) NSString *mobile;  //!< 手机号
@property (nonatomic, copy) NSString *unionId;  //!< union_id
@property (nonatomic, copy) NSString *lastLoginIp;  //!< 最后登陆 IP
@property (nonatomic, copy) NSString *createdAt;  //!< 创建时间
@property (nonatomic, copy) NSString *updatedAt;  //!< 修改时间

@end



@interface DZQDataAuth : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQAuthModel *attributes;    //!< 属性注释

@end

