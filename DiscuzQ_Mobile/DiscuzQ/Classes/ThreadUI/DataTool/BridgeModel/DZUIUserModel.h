//
//  DZUIUserModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZUIUserModel : NSObject

@property (nonatomic, copy) NSString *user_Name;  //!< 属性注释
@property (nonatomic, copy) NSString *user_Grade;  //!< 属性注释
@property (nonatomic, copy) NSString *user_Time;  //!< 属性注释
@property (nonatomic, copy) NSString *user_avatar;  //!< 属性注释

@property (nonatomic, assign) BOOL user_isReal;  //!< 是否实名认证
@property (nonatomic, assign) NSInteger user_isFollow;  //!< 是否已关注 -1 本人 0 未关注 1 已关注 2 互相关注
@property (nonatomic, assign) BOOL user_thread_isEssence;  //!< 主题 是否加精


+(instancetype)convertThreadModel:(DZQDataThread *)dataModel;

+(instancetype)convertFollowModel:(DZQDataFollow *)dataModel isFrom:(BOOL)isFrom;



@end

NS_ASSUME_NONNULL_END
