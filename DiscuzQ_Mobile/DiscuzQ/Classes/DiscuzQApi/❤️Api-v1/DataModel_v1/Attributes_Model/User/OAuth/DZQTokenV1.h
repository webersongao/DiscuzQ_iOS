//
//  DZQTokenV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQTokenV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *token_type;  //!< token 类型
@property (nonatomic, assign) NSTimeInterval expires_in;  //!< 时间
@property (nonatomic, copy) NSString *access_token;  //!< 用户标识
@property (nonatomic, copy) NSString *refresh_token;  //!< 刷新用户标识

-(BOOL)isExpired;

@end
