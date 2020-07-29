//
//  DZBaseForumModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZBaseForumModel : NSObject

// 板块 公共字段 1
@property (nonatomic, copy) NSString *fid;  // 版块ID
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *posts;      // 帖子数
@property (nonatomic, copy) NSString *threads;    // 主题数
@property (nonatomic, copy) NSString *todayposts; // 今日
@property (nonatomic, copy) NSString *forum_desc;  //!< 板块描述
@property (nonatomic, strong) NSArray<DZBaseForumModel *> *sublist;  //!< 属性注释

@property (nonatomic, copy) NSString *favorited; // 是否收藏 不稳定字段


@end


