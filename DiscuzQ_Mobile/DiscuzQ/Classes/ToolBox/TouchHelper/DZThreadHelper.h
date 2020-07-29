//
//  DZThreadHelper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadHelper : NSObject


// 点赞主题
+ (void)thread_LikeCellAction:(DZQPostModel *)postModel;

// 评论主题
+ (void)thread_CommentCellAction:(DZQPostModel *)postModel;

// 分享主题
+ (void)thread_SharedCellAction:(DZQPostModel *)postModel;

// 主题 收藏
+ (void)thread_FavoriteCellAction:(DZQPostModel *)postModel;

// 作者个人中心
+ (void)thread_UserCenterCellAction:(NSString *)user_id;

// 主题 附件 被点击
+ (void)thread_attachFileCellTapAction:(DZQDataAttachment *)attachDataModel;

// 主题 分类相关板块
+ (void)thread_CategoryCenterCellAction:(DZQDataCate *)cateModel;

// 主题管理（更多）
+ (void)thread_MoreCellAction:(DZQPostModel *)postModel sender:(UIButton *)sender;

// 话题详情
+ (void)thread_TopicDetailAction:(NSString *)topicId;

// 主题 付费 或 打赏用户列表
+ (void)thread_rewardOrPayListAction:(DZQPostModel *)postModel;

// 给主题 付费 或 打赏
+ (void)thread_rewardOrPayButtonAction:(DZQPostModel *)postModel;

// 点击 图片九宫格
+ (void)touchThreadPicSquareData:(NSArray<YBIBImageData *> *)attachArray DidSelectItem:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
