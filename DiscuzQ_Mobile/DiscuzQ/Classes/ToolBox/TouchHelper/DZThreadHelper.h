//
//  DZThreadHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadHelper : NSObject


// 点赞主题
+ (void)thread_LikeCellAction:(DZQPostV1 *)postModel block:(backBoolBlock)backBlock;

// 评论主题
+ (void)thread_CommentCellAction:(DZQThreadV1 *)threadModel;

// 分享主题
+ (void)thread_SharedCellAction:(DZQThreadV1 *)threadModel;

// 主题 收藏
+ (void)thread_FavoriteCellAction:(DZQDataThread *)dataThread block:(backBoolBlock)backBlock;

// 主题 举报
+ (void)thread_reportCellAction:(NSString *)threadId block:(backBoolBlock)backBlock;


// 主题 删除
+ (void)thread_deleteCellAction:(NSString *)threadId block:(backBoolBlock)backBlock;

// 作者个人中心
+ (void)thread_UserCenterCellAction:(NSString *)user_id;

// 主题 附件 被点击
+ (void)thread_attachFileCellTapAction:(DZQDataAttachment *)attachDataModel;

// 主题 分类相关板块
+ (void)thread_CategoryCenterCellAction:(DZThreadCateM *)cateModel;

// 话题详情
+ (void)thread_TopicDetailAction:(NSString *)topicId;

// 主题 付费 或 打赏用户列表
+ (void)thread_rewardOrPayListAction:(DZQPostV1 *)postModel;

// 给主题 付费 或 打赏
+ (void)thread_rewardOrPayButtonAction:(DZQPostV1 *)postModel;

// 主题管理（更多：分享 举报）
+ (void)thread_MoreCellAction:(DZQDataThread *)thread sender:(UIButton *)sender;

// 点击 图片九宫格
+ (void)touchThreadPicSquareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index;




#pragma mark ====  【【【【【【 主题的回复 】】】】】相关操作


// 评论回复
+ (void)post_CommentCellAction:(DZQPostV1 *)postModel;

/// 点赞回复
+ (void)post_LikeCellAction:(DZQPostV1 *)postModel block:(backBoolBlock)backBlock;


@end

NS_ASSUME_NONNULL_END
