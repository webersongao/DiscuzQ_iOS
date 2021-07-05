//
//  DZSearchModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZSearchModel : NSObject

//"realtid": "26",
//"folder": "common",
//"new": "0",
//"id": "844658",
//"forumname": "日常吹水",
//"lastposterenc": "webersongao",
//"multipage": "",
//"message"

@property (nonatomic, copy) NSString *tid;  //!< 属性注释
//@property (nonatomic, copy) NSString *fid;  //!< 属性注释
//@property (nonatomic, copy) NSString *posttableid;  //!< 属性注释
//@property (nonatomic, copy) NSString *typeId;  //!< 属性注释
//@property (nonatomic, copy) NSString *sortid;  //!< 属性注释
//@property (nonatomic, copy) NSString *readperm;  //!< 属性注释
//@property (nonatomic, copy) NSString *price;  //!< 属性注释
//@property (nonatomic, copy) NSString *author;  //!< 属性注释
//@property (nonatomic, copy) NSString *pid;  //!< 属性注释
//@property (nonatomic, copy) NSString *authorid;  //!< 属性注释
//@property (nonatomic, copy) NSString *subject;  //!< 属性注释
//@property (nonatomic, copy) NSString *dateline;  //!< 属性注释
//@property (nonatomic, copy) NSString *lastpost;  //!< 属性注释
//@property (nonatomic, copy) NSString *lastposter;  //!< 属性注释
//@property (nonatomic, copy) NSString *views;  //!< 属性注释
//@property (nonatomic, assign) NSInteger replies;  //!< 属性注释
//@property (nonatomic, copy) NSString *displayorder;  //!< 属性注释
//@property (nonatomic, copy) NSString *highlight;  //!< 属性注释
//@property (nonatomic, copy) NSString *digest;  //!< 属性注释
//@property (nonatomic, copy) NSString *rate;  //!< 属性注释
//@property (nonatomic, copy) NSString *special;  //!< 属性注释
//@property (nonatomic, copy) NSString *attachment;  //!< 属性注释
//@property (nonatomic, copy) NSString *moderated;  //!< 属性注释
//@property (nonatomic, copy) NSString *closed;  //!< 属性注释
//@property (nonatomic, copy) NSString *stickreply;  //!< 属性注释
//@property (nonatomic, copy) NSString *recommends;  //!< 属性注释
//@property (nonatomic, copy) NSString *recommend_add;  //!< 属性注释
//@property (nonatomic, copy) NSString *recommend_sub;  //!< 属性注释
//@property (nonatomic, copy) NSString *heats;  //!< 属性注释
//@property (nonatomic, copy) NSString *status;  //!< 属性注释
//@property (nonatomic, copy) NSString *isgroup;  //!< 属性注释
//@property (nonatomic, copy) NSString *favtimes;  //!< 属性注释
//@property (nonatomic, copy) NSString *sharetimes;  //!< 属性注释
//@property (nonatomic, copy) NSString *stamp;  //!< 属性注释
//@property (nonatomic, copy) NSString *icon;  //!< 属性注释
//@property (nonatomic, copy) NSString *pushedaid;  //!< 属性注释
//@property (nonatomic, copy) NSString *cover;  //!< 属性注释
//@property (nonatomic, copy) NSString *replycredit;  //!< 属性注释
//@property (nonatomic, copy) NSString *relatebytag;  //!< 属性注释
//@property (nonatomic, copy) NSString *maxposition;  //!< 属性注释
//@property (nonatomic, copy) NSString *bgcolor;  //!< 属性注释
//@property (nonatomic, copy) NSString *comments;  //!< 属性注释
//@property (nonatomic, copy) NSString *hidden;  //!< 属性注释

@property (nonatomic, copy) NSString *realtid;  //!< 属性注释
@property (nonatomic, copy) NSString *folder;  //!< 属性注释
@property (nonatomic, copy) NSString *src_new;  //!< new字段
@property (nonatomic, copy) NSString *src_id;  //!< id 字段
@property (nonatomic, copy) NSString *forumname;  //!< 属性注释
@property (nonatomic, copy) NSString *lastposterenc;  //!< 属性注释
@property (nonatomic, copy) NSString *multipage;  //!< 属性注释
@property (nonatomic, copy) NSString *message;  //!< 属性注释

// 自定义字段
@property (nonatomic, copy) NSString *keyword;




@end
