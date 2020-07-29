//
//  DZGlobalTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoverModel.h"

@interface DZGlobalTool : NSObject

+(void)DZ_RequestGlobalForumCategory:(void(^)(DiscoverModel *indexModel))categoryBlock;

@end


