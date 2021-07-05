//
//  DZQPostRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQThreadV1.h"
#import "DZQGoodsV1.h"
#import "DZQAttachmentV1.h"


@interface DZQPostRelationV1 : DZQSuperRelation

@property (nonatomic, strong) DZQDataUser *user;  //!<  回复的作者
@property (nonatomic, strong) DZQDataThread *thread;  //!<  回复所对应的主题
@property (nonatomic, strong) DZQDataUser *replyUser;  //!< 回复所回复的用户
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *images;  //!< 回复的图片

@property (nonatomic, strong) NSArray<DZQDataUser *> *likedUsers;  //!< 点赞回复的用户（主题详情接口）
@property (nonatomic, strong) NSArray<DZQDataAttachment *> *attachments;  //!< 首贴附件(主题详情接口)

@property (nonatomic, strong) DZQDataGoods *postGoods;  //!<  商品信息


@end


