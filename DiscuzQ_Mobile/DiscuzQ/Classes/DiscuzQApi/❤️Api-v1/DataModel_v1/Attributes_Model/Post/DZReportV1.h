//
//  DZReportV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"


@interface DZReportV1 : DZQSuperAttribute

@property (nonatomic, copy) NSString *user_id;  //!< 举报人的用户ID
@property (nonatomic, copy) NSString *thread_id;  //!< 被举报的主题ID
@property (nonatomic, copy) NSString *post_id;  //!< 被举报的回复内容ID
@property (nonatomic, copy) NSString *reason;  //!< 举报理由

@property (nonatomic, assign) NSInteger type;  //!< 举报类型    0个人主页 1主题 2评论/回复
@property (nonatomic, assign) NSInteger status;  //!< 举报状态    0未处理 1已处理

@property (nonatomic, copy) NSString *created_at;  //!< 举报创建时间
@property (nonatomic, copy) NSString *updated_at;  //!< 举报修改时间

@end


@interface DZQDataReport: DZQSuperData


@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释
@property (nonatomic, strong) DZReportV1 *attributes;    //!< 属性注释

@end
