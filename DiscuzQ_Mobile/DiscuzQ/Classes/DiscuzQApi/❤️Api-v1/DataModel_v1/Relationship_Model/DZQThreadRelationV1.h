//
//  DZQThreadRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//   分类帖子列表页

#import "DZQSuperModel.h"
#import "DZQUserV1.h"
#import "DZQTopicV1.h"
#import "DZQPostV1.h"
#import "DZReportV1.h"
#import "DZQCateV1.h"

// 需要继承自 DZQSuperRelation

@interface DZQThreadRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 主题作者(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataTopic *topic;  //!< 主题话题
@property (nonatomic, strong) DZQDataCate *category;  //!< 主题分类(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataUser *deletedUser;  //!< 删除用户
@property (nonatomic, strong) DZQDataUser *lastPostedUser;  //!< 最后回复用户（列表接口）

@property (nonatomic, strong) DZQDataPost *firstPost;  //!< 首帖(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataVideo *threadVideo;  //!< 视频(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataVideo *threadAudio;  //!< 音频(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataQesAnswer *question;  //!< 问答信息(包含答案信息)(列表 + 详情接口)
@property (nonatomic, strong) NSArray<DZQDataPost *> *posts;  //!< 主题回复信息(详情接口)

@property (nonatomic, strong) NSArray<DZQDataPost *> *lastThreePosts;  //!< 最后三条回复
@property (nonatomic, strong) NSArray<DZQDataUser *> *paidUsers;  //!< 付费主题的用户（列表接口,详情接口）
@property (nonatomic, strong) NSArray<DZQDataUser *> *rewardedUsers;  //!< 打赏主题的用户（列表接口,详情接口）
@property (nonatomic, strong) NSArray<DZQDataUser *> *onlookers;  //!< 付费主题的用户（列表接口,详情接口）

//@property (nonatomic, strong) DZQDataPost *lastDeletedLog;  //!< 最后一次被删除的操作日志





@end




