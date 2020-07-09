//
//  DZForTitleModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    DZ_ListAll,
    DZ_ListBest,
    DZ_ListFollow
} DZ_ListType;


@interface DZForTitleModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic, assign) DZ_ListType listType;  //!< 属性注释

+ (instancetype)modelName:(NSString *)name type:(DZ_ListType)type;

@end
