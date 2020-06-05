//
//  DZDiscoverTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZDiscoverTool : NSObject

+(NSArray<DZQDataThread *>*)discoverResData:(DZQResModel *)resModel style:(Class)styleCls;




@end

