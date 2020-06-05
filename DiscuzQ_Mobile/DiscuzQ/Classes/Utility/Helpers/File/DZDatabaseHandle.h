//
//  DZDatabaseHandle.h
//  DiscuzQ
//
//  Created by WebersonGao on 2017/5/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DZThreadListModel;

@interface DZDatabaseHandle : NSObject

// 单例
+ (instancetype)Helper;

// 打开数据库
- (void)openDB;

- (void)closeDB;


/**
 * 存储足迹的帖子
 */
- (void)footThread:(DZThreadListModel *)thread;

/**
 * 查询足迹的一个帖子
 */
- (DZThreadListModel *)searchFootThreadTid:(NSString *)tid;

/**
 * 查询某用户所有足迹
 */
- (NSArray *)searchFootWithUid:(NSString *)uid;

/**
 查询t_foot表中的数据数量
 
 @param uid 用户id
 @return 数据条数
 */
- (NSInteger)countForFootUid:(NSString *)uid;

/**
 * 按页数查询某用户足迹
 */
- (NSArray *)searchFootWithUid:(NSString *)uid andPage:(NSInteger)page andPerpage:(NSInteger)perPage;

/**
 * 删除某条足迹
 */
- (void)removeFootThreadWithtid:(NSString *)tid;

/**
 * 删除该用户所有足迹
 */
- (void)removeAllFootThread:(NSString *)uid;

/**
 * 判断是否足迹过
 */
- (BOOL)isFoot:(NSString *)tid;

@end
