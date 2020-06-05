//
//  DZNotiItem.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DZMList_System     @"system"  // 系统通知
#define DZMList_reply      @"replied" // 回复我的
#define DZMList_like       @"liked"   // 点赞
#define DZMList_reward     @"rewarded"// 打赏、支付
#define DZMList_relate     @"related" // @我的
#define DZMList_withdrawal @"withdrawal" // 提现通知


@interface DZNotiItem : NSObject

@property (nonatomic, copy) NSString *noti_icon;  //!< 类型图标
@property (nonatomic, copy) NSString *noti_Name;  //!< 类型名称
@property (nonatomic, copy) NSString *NotiType;  //!< 属性注释
@property (nonatomic, assign) NSInteger count;  //!< 未读消息数量


- (instancetype)initWithNotiType:(NSString *)NotiType count:(NSInteger)count;


@end

