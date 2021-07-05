//
//  DataBaseHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  #import "DataBaseHeader.h"

#ifndef DataBaseHeader_h
#define DataBaseHeader_h

#import "DZDataHelper+Update.h"
#import "DZDataHelper+ThreadCateM.h"
#import "DZDataHelper+UserM.h"
#import "DZDataHelper+DialogM.h"
#import "DZDataHelper+MessageM.h"
#import "DZDataHelper+DZSiteM.h"
#import "DZDataHelper+EmojiM.h"
#import "DZDataHelper+NotificationM.h"
#import "DZDataHelper+ThreadDraftM.h"



// 数据库 通用配置信息
#define kDZLocalDBVersion 1
#define kDZLocalDBFileName @"PRDouMao.sqlite"


#define kDZDataUserTable          @"DQ_UserInfoTable"  /// 用户信息 以及 token
#define KDZDataSiteTable          @"DQ_SiteInfoTable"    // 站点信息
#define KDZDataEmojiTable         @"DQ_SiteEmojiTable"    // 用户表情包
#define kDZDataCateTable          @"DQ_ThreadCateTable"  // 主题分类
#define KDZDataPostDraftTable     @"DQ_PostDraftTable"   // 评论草稿箱
#define KDZDataThreadDraftTable   @"DQ_ThreadDraftTable"  // 主题草稿箱

#define KDZDataSessionTable        @"DQ_SessionListTable"  // 私信对话列表
#define KDZDataMessageTable        @"DQ_MessageListTable"  // 私信对话详情
#define KDZDataNotificationTable   @"DQ_NotificationTable"  // 通知草稿箱


#endif /* DataBaseHeader_h */
