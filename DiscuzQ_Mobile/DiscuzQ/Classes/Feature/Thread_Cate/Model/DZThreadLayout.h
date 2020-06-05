//
//  DZThreadLayout.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DZThreadListModel;

@interface DZTHHeadLayout : NSObject

@property (nonatomic, assign) CGRect iconFrame;  //!< 头像
@property (nonatomic, assign) CGRect nameFrame;  //!< 昵称
@property (nonatomic, assign) CGRect gradeFrame;  //!< 管理组
@property (nonatomic, assign) CGRect tagFrame;  //!< 置顶 或 精华
@property (nonatomic, assign) CGRect timeFrame;  //!< 时间

@end

@interface DZTHBottomLayout : NSObject

@property (nonatomic, assign) CGRect viewFrame;  //!< 浏览
@property (nonatomic, assign) CGRect replyFrame;  //!< 回复
@property (nonatomic, assign) CGRect zanFrame;  //!< 赞
@property (nonatomic, assign) CGRect lineFrame;  //!< 底部工具条的灰色分割线

@end

@interface DZThreadLayout : NSObject

@property (nonatomic, assign) CGRect headFrame;  //!< 头像基本信息
@property (nonatomic, assign) CGRect titleFrame;  //!< 标题
@property (nonatomic, assign) CGRect contentFrame;  //!< 内容 或 最近回复
@property (nonatomic, assign) CGRect attachFrame;  //!< 附件总高度
@property (nonatomic, assign) CGRect bottomFrame;  //!< 点赞 评论工具条

@property (nonatomic, strong) DZTHHeadLayout *headLayout;  //!< 头部的布局
@property (nonatomic, strong) DZTHBottomLayout *bottomLayout;  //!< 头部的布局

@property (nonatomic, assign) BOOL isTop;  //!< 是否是置顶帖
@property (nonatomic, assign) CGFloat cellHeight;  //!< 总高度


- (instancetype)initWithModel:(DZThreadListModel *)Model isList:(BOOL)isList isTop:(BOOL)isTop;

@end


