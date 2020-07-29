//
//  DZThreadListModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/18.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZThreadReplyModel.h"
#import "DZThreadLayout.h"
@class DZAttachModel;

@interface DZThreadListModel : NSObject

@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *readperm;  //!< 属性注释
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *authorid;
@property (nonatomic, copy) NSString *subject; // 标题
@property (nonatomic, copy) NSString *dateline;
@property (nonatomic, copy) NSString *lastpost;
@property (nonatomic, copy) NSString *lastposter;
@property (nonatomic, copy) NSString *views;   // 查看数
@property (nonatomic, copy) NSString *replies; // 回复数
@property (nonatomic, copy) NSString *recommend_add; // 点赞数
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *displayorder; // 判断是不是置顶帖子  displayorder  3，2，1 置顶 全局置顶3  分类置顶2  本版置顶1  0 正常  -1 回收站  -2 审核中  -3 审核忽略  -4草稿
@property (nonatomic, copy) NSString *special; //判断帖子类型 0普通 1投票 2商品  3悬赏 4活动 5辩论
@property (nonatomic, copy) NSString *attachment;
@property (nonatomic, copy) NSString *replycredit;  //!< 属性注释
@property (nonatomic, copy) NSString *dbdateline;  // 1 点赞过了
@property (nonatomic, copy) NSString *dblastpost;  // 1 点赞过了
@property (nonatomic, copy) NSString *rushreply;  // 1 点赞过了
@property (nonatomic, copy) NSString *recommend;  // 1 点赞过了
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, strong) NSArray<DZThreadReplyModel *> *reply;  //!< 属性注释
@property (nonatomic, strong) NSMutableArray<DZAttachModel*> *attachlist;

@property (nonatomic, copy) NSString *message; // 内容
@property (nonatomic, assign) BOOL isRecently;
@property (nonatomic, strong) NSDictionary *forumnames;


// 自定义字段，接口里面没有
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *grouptitle;


@property (nonatomic, strong) UIImage *tagImage;  // 精华 置顶 等标记的图片
@property (nonatomic, copy) NSString *gradeName;
@property (nonatomic, strong) NSMutableArray *imglist;
@property (nonatomic, strong) DZThreadLayout *listLayout;  //!< 列表模式 帖子布局属性
@property (nonatomic, strong) DZThreadLayout *squareLayout;  //!< 方框九宫格 模式
@property (nonatomic, copy) NSString * mainTitleString;  // 标题
@property (nonatomic, copy) NSAttributedString *mainTitle;  // 标题

@property (nonatomic, copy) NSString *lastReplyString;  // 最新回复
@property (nonatomic, strong) NSAttributedString *lastReply;  // 最新回复

-(void)updateThreadModelLayout;


@end
