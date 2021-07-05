//
//  DZUserItemModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    cell_fans,   // 粉丝（关注我的）
    cell_topic,  // 主题、帖子
    cell_draft,  // 草稿箱
    cell_logout,  // 退出账户
    cell_invate,  // 邀请码
    cell_follow,  // 我的关注
    cell_avatar,  /// 换头像
    cell_wallet,  // 我的钱包
    cell_profile,  // 个人详情页面
    cell_colorMode,  // 夜间模式
    cell_favorite
} cellAction;

@interface DZUserItemModel : NSObject

@property (nonatomic, assign, readonly) BOOL isIndicator;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *titleStr;
@property (nonatomic, copy, readonly) NSString *detailStr;
@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, assign, readonly) cellAction action;  //!< 属性注释

+(NSArray <DZUserItemModel *>*)localListData;

@end

