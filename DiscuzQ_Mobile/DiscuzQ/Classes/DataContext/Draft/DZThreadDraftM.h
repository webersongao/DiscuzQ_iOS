//
//  DZThreadDraftM.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootModel.h"
#import "DZDraftSub.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadDraftM : DZRootModel

@property (nonatomic, copy) NSString *title;     //!< 标题（发布帖子时必须）
@property (nonatomic, copy) NSString *content;     //!< 内容（发布帖子时支持 Markdown 语法）
@property (nonatomic, assign) float price;  //!< 价格（发布帖子时可设置价格发布付费主题）
@property (nonatomic, assign) float attachment_price;  //!< 附件价格
@property (nonatomic, assign) NSInteger free_words;  //!< 付费主题可免费阅读字数百分比(使用小数)
@property (nonatomic, assign) NSInteger type;  //!< 文章类型（0:文字 1:帖子 2:视频 3:图片 4:语音 5:问答 6:商品）
@property (nonatomic, copy) NSString *longitude;     //!< 经度 float
@property (nonatomic, copy) NSString *latitude;     //!< 纬度 float
@property (nonatomic, copy) NSString *address;     //!< 经纬度坐标对应的地址（如：广东省深圳市深南大道 10000 号）
@property (nonatomic, copy) NSString *location;     //!< 经纬度坐标对应的位置（如：腾讯大厦）

@property (nonatomic, copy) NSString *file_id;     //!< 视频 file_id 视频类型文章必填
@property (nonatomic, copy) NSString *file_name;     //!< 视频文件名称
@property (nonatomic, copy) NSString *cover_url;     //!< 视频封面地址
@property (nonatomic, copy) NSString *media_url;     //!< 视频地址

@property (nonatomic, assign) BOOL is_draft;  //!< 是否草稿箱 ，0否 ，1是
@property (nonatomic, assign) BOOL is_anonymous;  //!< 是否发布匿名帖
@property (nonatomic, assign) NSUInteger post_goods_id;  //!< 商品ID


// relation 属性
@property (nonatomic, strong) DZThreadDraftMCate *category;  //!< 主题分类关联关系
@property (nonatomic, strong) DZThreadDraftMQues *question;  //!< 问答帖子关联关系
@property (nonatomic, strong) NSArray<DZThreadDraftMAttach *> *attachments;  //!< 主题图片、附件关联关系

// relation 属性对应的jsonString串 用于本地存储
@property (nonatomic, copy) NSString *categoryjsonString;     //!< 属性注释
@property (nonatomic, copy) NSString *questionjsonString;     //!< 属性注释
@property (nonatomic, copy) NSString *attachmentsjsonString;     //!< 属性注释


// 转换成 主题发送参数字典
-(NSDictionary *)parameterToSendThreadWithCaptcha:(NSDictionary *)captcha;


@end



NS_ASSUME_NONNULL_END
