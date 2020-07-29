//
//  DZPostTool.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/2.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostTool.h"
#import "DZTabItem.h"
#import "DZPostVideoController.h"
#import "DZPostArticleController.h"
#import "DZPostNormalController.h"

@implementation DZPostTool

+(NSArray *)localPostTab{
    
    DZTabItem *item01 = [[DZTabItem alloc] initWithTitle:@"文章" class:[DZPostArticleController class]];
    DZTabItem *item02 = [[DZTabItem alloc] initWithTitle:@"主题" class:[DZPostNormalController class]];
    DZTabItem *item03 = [[DZTabItem alloc] initWithTitle:@"视频" class:[DZPostVideoController class]];
    
    return @[item01,item02,item03];
    
}

@end
