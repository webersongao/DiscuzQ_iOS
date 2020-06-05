//
//  DZQThreadRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//   分类帖子列表页

#import "DZQSuperModel.h"
#import "DZQUserModel.h"
#import "DZQPostModel.h"
#import "DZQCateModel.h"

// 需要继承自 DZQSuperRelation

@interface DZQThreadRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!< 主题作者(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataCate *category;  //!< 主题分类(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataUser *lastPostedUser;  //!< 最后回复用户（列表接口）

@property (nonatomic, strong) DZQDataPost *firstPost;  //!< 首帖(列表接口 和 详情接口)
@property (nonatomic, strong) DZQDataVideo *threadVideo;  //!< 视频(列表接口 和 详情接口)
@property (nonatomic, strong) NSArray<DZQDataPost *> *posts;  //!< 主题回复信息(详情接口)

@property (nonatomic, strong) NSArray<DZQDataUser *> *rewardedUsers;  //!< 打赏主题的用户（列表接口,详情接口）



@end




