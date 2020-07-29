//
//  ForumModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/21.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZBaseForumModel.h"

@interface ForumModel : DZBaseForumModel

//"fid": "2",
//"name": "默认版块",
//"threads": "3",
//"posts": "4",
//"todayposts": "0",
//"lastpost": "2019-11-19 11:02",

// 公共字段 2
@property (nonatomic, copy) NSString *lastpost;  //!< 最新发布 时间
@property (nonatomic, copy) NSString *lastposter;  //!< 最新发布用户名
@property (nonatomic, copy) NSString *lastpost_tid;  //!< 最新帖子ID
@property (nonatomic, copy) NSString *lastpost_subject;  //!< 最新发布 主题名称

// 以下字段 区分接口使用 慎用！！！
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *threadmodcount;
@property (nonatomic, copy) NSString *title;


@property (nonatomic, copy) NSString *allowspecialonly;
@property (nonatomic, copy) NSString *autoclose;
@property (nonatomic, copy) NSString *fup;
@property (nonatomic, copy) NSString *rules;
@property (nonatomic, copy) NSString *livetid;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *picstyle;
@property (nonatomic, assign) NSInteger price;  //!< 属性注释
@property (nonatomic, assign) NSInteger threadcount;  //!< 属性注释


@end
