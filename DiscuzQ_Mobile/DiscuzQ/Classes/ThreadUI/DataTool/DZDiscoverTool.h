//
//  DZDiscoverTool.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZDiscoverTool : NSObject

+(NSArray<DZQDataPost *>*)post_dataPostResData:(DZQResModel *)resModel style:(Class)styleCls;

+(NSArray<DZQDataThread *>*)thead_dataThreadResData:(DZQResModel *)resModel style:(Class)styleCls;



@end

