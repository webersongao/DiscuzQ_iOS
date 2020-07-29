//
//  BaseResModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/27.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZBaseVarModel.h"
#import "GlobalModel.h"

@interface BaseResModel : NSObject

@property (nonatomic, copy) NSString *Version;  //!< API版本
@property (nonatomic, copy) NSString *Charset;  //!< 字符编码
@property (nonatomic, copy) NSString *Message;  //!< 属性注释



@end


