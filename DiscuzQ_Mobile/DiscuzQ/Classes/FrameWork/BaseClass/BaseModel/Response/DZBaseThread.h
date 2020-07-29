//
//  DZBaseThread.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZBaseThread : NSObject

//"author": "webersongao",
//"authorid": "1",
//"subject": "第31个世界艾滋病日防艾公益健康跑鸣枪启程传染不",
//"dateline": "1574342981",
//"lastpost": "2019-11-21 21:54",


@property (nonatomic, copy) NSString *tid;  //!< 属性注释
@property (nonatomic, copy) NSString *fid;  //!< 属性注释
@property (nonatomic, copy) NSString *posttableid;  //!< 属性注释
@property (nonatomic, copy) NSString *typeId;  //!< 属性注释
@property (nonatomic, copy) NSString *sortid;  //!< 属性注释
@property (nonatomic, copy) NSString *readperm;  //!< 属性注释
@property (nonatomic, copy) NSString *price;  //!< 属性注释
@property (nonatomic, copy) NSString *author;  //!< 属性注释
@property (nonatomic, copy) NSString *pid;  //!< 属性注释
@property (nonatomic, copy) NSString *authorid;  //!< 属性注释
@property (nonatomic, copy) NSString *subject;  //!< 属性注释
@property (nonatomic, copy) NSString *dateline;  //!< 属性注释
@property (nonatomic, copy) NSString *lastpost;  //!< 属性注释
@property (nonatomic, copy) NSString *lastposter;  //!< 属性注释
@property (nonatomic, copy) NSString *views;  //!< 属性注释
@property (nonatomic, assign) NSInteger replies;  //!< 属性注释
@property (nonatomic, copy) NSString *displayorder;  //!< 属性注释
@property (nonatomic, copy) NSString *highlight;  //!< 属性注释
@property (nonatomic, copy) NSString *digest;  //!< 属性注释
@property (nonatomic, copy) NSString *rate;  //!< 属性注释
@property (nonatomic, copy) NSString *special;  //!< 属性注释
@property (nonatomic, copy) NSString *attachment;  //!< 属性注释
@property (nonatomic, copy) NSString *moderated;  //!< 属性注释
@property (nonatomic, copy) NSString *closed;  //!< 属性注释
@property (nonatomic, copy) NSString *stickreply;  //!< 属性注释
@property (nonatomic, copy) NSString *recommends;  //!< 属性注释
@property (nonatomic, copy) NSString *recommend_add;  //!< 属性注释
@property (nonatomic, copy) NSString *recommend_sub;  //!< 属性注释
@property (nonatomic, copy) NSString *heats;  //!< 属性注释
@property (nonatomic, copy) NSString *status;  //!< 属性注释
@property (nonatomic, copy) NSString *isgroup;  //!< 属性注释
@property (nonatomic, copy) NSString *favtimes;  //!< 属性注释
@property (nonatomic, copy) NSString *sharetimes;  //!< 属性注释
@property (nonatomic, copy) NSString *stamp;  //!< 属性注释
@property (nonatomic, copy) NSString *icon;  //!< 属性注释
@property (nonatomic, copy) NSString *pushedaid;  //!< 属性注释
@property (nonatomic, copy) NSString *cover;  //!< 属性注释
@property (nonatomic, copy) NSString *replycredit;  //!< 属性注释
@property (nonatomic, copy) NSString *relatebytag;  //!< 属性注释
@property (nonatomic, copy) NSString *maxposition;  //!< 属性注释
@property (nonatomic, copy) NSString *bgcolor;  //!< 属性注释
@property (nonatomic, copy) NSString *comments;  //!< 属性注释
@property (nonatomic, copy) NSString *hidden;  //!< 属性注释

@end


