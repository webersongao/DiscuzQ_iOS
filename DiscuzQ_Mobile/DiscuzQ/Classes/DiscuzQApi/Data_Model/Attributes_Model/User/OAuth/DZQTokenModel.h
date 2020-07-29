//
//  DZQTokenModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQTokenModel : DZQSuperAttribute

@property (nonatomic, copy) NSString *token_type;  //!< token 类型
@property (nonatomic, assign) NSTimeInterval expires_in;  //!< 时间
@property (nonatomic, copy) NSString *access_token;  //!< 用户标识
@property (nonatomic, copy) NSString *refresh_token;  //!< 刷新用户标识

@end
