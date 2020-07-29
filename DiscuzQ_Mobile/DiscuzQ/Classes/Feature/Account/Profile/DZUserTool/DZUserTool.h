//
//  DZUserTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZUserTool : NSObject

+(NSArray<DZQDataFollow *>*)User_dataFollowResData:(DZQResModel *)resModel;


@end

NS_ASSUME_NONNULL_END
