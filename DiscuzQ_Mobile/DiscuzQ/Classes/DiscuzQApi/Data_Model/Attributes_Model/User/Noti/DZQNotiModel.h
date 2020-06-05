//
//  DZQNotiModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/16.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"

@interface DZQNotiModel : DZQSuperAttribute

//"id": 13816,
//"user_id": 6595,
//"read_at": "2020-05-13T10:40:03+08:00",
//"created_at": "2020-05-13T10:39:08+08:00",
//"title": "欢迎加入Discuz! Q",
//"content": "iOSUser你好，你已经成为Discuz! Q 的普通会员 ，请您在发表言论时，遵守当地法律法规。祝你在这里玩的愉快。",
//-"raw": {
//"tpl_id": 1
//}

/// 通用字段
@property (nonatomic, copy) NSString *type;     //!< 通知类型
@property (nonatomic, copy) NSString *noti_id;  //!< 通知id
@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, copy) NSString *read_at;  //!< 属性注释
@property (nonatomic, copy) NSString *created_at;  //!< 属性注释

/// 系统通知
@property (nonatomic, copy) NSString *title;  //!< 属性注释         （系统）
@property (nonatomic, copy) NSString *content;  //!<通知内容        （系统/打赏）
@property (nonatomic, strong) NSDictionary *raw;  //!< 属性注释     （系统）

/// 点赞/回复/@通知/
@property (nonatomic, copy) NSString *post_id;  //!< 属性注释       （点赞/回复/@通知）
@property (nonatomic, copy) NSString *thread_id;  //!< 属性注释     （点赞/回复/@通知/打赏）
@property (nonatomic, copy) NSString *post_content;  //!< 属性注释  （点赞/回复/@通知）
@property (nonatomic, copy) NSString *thread_title;  //!< 属性注释  （点赞/回复/@通知/打赏）
@property (nonatomic, copy) NSString *user_name;  //!< 用户名       （点赞/回复/@通知/打赏）
@property (nonatomic, copy) NSString *user_avatar;  //!< 头像      （点赞/回复/@通知/打赏）

/// 打赏
@property (nonatomic, copy) NSString *order_id;  //!< 打赏订单id    （打赏）
@property (nonatomic, assign) float amount;  //!< 打赏金额(注意小数点)      （打赏）


@end


@interface DZQDataNoti : DZQSuperData

@property (nonatomic, copy) NSString *type;     //!< 属性注释
@property (nonatomic, copy) NSString *type_id;  //!< 属性注释
@property (nonatomic, strong) DZQNotiModel *attributes;    //!< 属性注释

@end
