//
//  DZQWrapper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZQDataConvert.h"

#define kWrapper(cls,cvt) [DZQWrapper wrapperWithClass:(cls) convert:(cvt)]

#define kModelWrapper(modelCls) [DZQModelWrapper wrapperWithModelClass:(modelCls)]

@interface DZQModelWrapper : NSObject

@property (nonatomic, strong) Class attCls;

+ (instancetype)wrapperWithModelClass:(Class)kClass;

@end




@interface DZQWrapper : NSObject

@property (nonatomic, strong) Class relateCls;
@property (nonatomic, strong) DZQDataConvert *convert;

+ (instancetype)wrapperWithClass:(Class)kClass convert:(DZQDataConvert *)convert;

@end


