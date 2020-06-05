//
//  DZThreadVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadVarModel.h"
#import "DZThreadListModel+Display.h"

@implementation DZThreadVarModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"forum_threadlist" : [DZThreadListModel class]};
}

/**
 处理接口传进来的responseObject
 @param fid 本版fid
 @param page 页数
 @param handle block回调传参  topArr：置顶帖数组 commonArr：普通帖子数组 allArr：全部帖子  notFourmCount：非本版帖子数
 */
- (void)updateVarModel:(NSString *)fid andPage:(NSInteger)page handle:(void (^)(NSArray *topArr, NSArray *commonArr, NSArray *allArr, NSInteger notFourmCount))handle {
    
    NSMutableArray *topArray = [NSMutableArray array];
    NSMutableArray *commonArray = [NSMutableArray array];
    NSMutableArray *allArray = [NSMutableArray array];
    
    NSInteger notThisFidCount = 0;
    
    for (DZThreadListModel * innerModel in self.forum_threadlist) {
        DZThreadListModel *listModel = [innerModel dealModelWithPage:page andGroup:self.groupiconid andType:self.threadtypes.types];
        [allArray addObject:listModel];
        if (page == 1) {
            if ([listModel isCurrentForum:fid]) { // 非本版帖子
                notThisFidCount ++;
            }
            if ([listModel isTopThread]) { // 全局置顶3  分类置顶2  本版置顶1
                [topArray addObject:listModel];
            } else {
                [commonArray addObject:listModel];
            }
        } else {
            [commonArray addObject:listModel];
        }
    }
    
    handle?handle(topArray,commonArray,allArray,notThisFidCount):nil;
}

@end
