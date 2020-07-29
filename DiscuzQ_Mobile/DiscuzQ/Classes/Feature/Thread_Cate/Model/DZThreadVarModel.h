//
//  DZThreadVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/28.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseAuthModel.h"
#import "ForumModel.h"
#import "DZThreadListModel.h"

@interface DZThreadVarModel : DZBaseAuthModel


//"allowperm": {5 items},
//"forum": {18 items},
//"forum_threadlist": [10 items],
//"groupiconid": {2 items},
//"sublist": [],
//"tpp": "10",
//"page": "1",
//"reward_unit": "金钱",
//"activity_setting": {2 items},
//"threadtypes": {5 items}

@property (nonatomic, strong) NSArray<DZThreadListModel *> *forum_threadlist;  //!< 属性注释
@property (nonatomic, strong) NSDictionary *groupiconid;  //!< 属性注释
@property (nonatomic, strong) NSArray <NSDictionary *>*sublist;  //!< 属性注释

@property (nonatomic, copy) NSString *tpp;  //!< 属性注释
@property (nonatomic, assign) NSInteger page;  //!< 属性注释
@property (nonatomic, copy) NSString *reward_unit;  //!< 属性注释

/**
 处理接口传进来的responseObject
 @param fid 本版fid
 @param page 页数
 @param handle block回调传参  topArr：置顶帖数组 commonArr：普通帖子数组 allArr：全部帖子  notFourmCount：非本版帖子数
 */
- (void)updateVarModel:(NSString *)fid andPage:(NSInteger)page handle:(void (^)(NSArray *topArr, NSArray *commonArr, NSArray *allArr, NSInteger notFourmCount))handle;

@end


