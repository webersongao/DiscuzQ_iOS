//
//  DZThreadListModel+Display.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/31.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListModel.h"

@class DZThreadVarModel;

@interface DZThreadListModel (Display)

/**
 根据帖子类型设置描述
 
 @param page 页数
 @param groupDic 所在群组
 @param typeDic 帖子类型 投票、活动等
 @return 帖子model
 */
-(DZThreadListModel *)dealModelWithPage:(NSInteger)page andGroup:(NSDictionary *)groupDic andType:(NSDictionary *)typeDic;

- (DZThreadListModel *)dealSpecialThread;


// 展示形式是否要依照特殊帖子的判断。
- (BOOL)isSpecialThread;

// 置顶帖判断
- (BOOL)isTopThread;
// 是否是本版帖子
- (BOOL)isCurrentForum:(NSString *)fid;


@end

