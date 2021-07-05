//
//  DZThreadHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadHelper.h"
#import "DZMediaBrowser.h"

@implementation DZThreadHelper

// 点赞主题
+ (void)thread_LikeCellAction:(DZQPostV1 *)postModel block:(backBoolBlock)backBlock{

    [[DZNetCenter center] dzx_PostLikeOrNotWithPost:postModel.inner_id isLiked:!postModel.isLiked completion:^(DZQDataPost * _Nonnull dataPost, BOOL success) {
        postModel.isLiked = dataPost.attributes.isLiked;
        if (backBlock) {
            backBlock(dataPost.attributes.isLiked);
        }
    }];
    
}

// 评论主题
+ (void)thread_CommentCellAction:(DZQThreadV1 *)threadModel{
    
    [[DZMobileCtrl sharedCtrl] PresentPostPublishController];
    
}

// 分享主题
+ (void)thread_SharedCellAction:(DZQThreadV1 *)postModel{
    
    KSLog(@"WBS 分享~~~");
    
    [[DZMobileCtrl sharedCtrl] shareThreadActionWithModel:nil];
}

// 主题 收藏
+ (void)thread_FavoriteCellAction:(DZQDataThread *)dataThread block:(backBoolBlock)backBlock{
    
    [[DZNetCenter center] dzx_threadFavoriteWithThread:dataThread.inner_id isFavorite:!dataThread.attributes.isFavorite completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
        dataThread.attributes.isFavorite = varModel.attributes.isFavorite;
        if (backBlock) {
            backBlock(varModel.attributes.isFavorite);
        }
    }];
    
}

// 主题 举报
+ (void)thread_reportCellAction:(NSString *)threadId block:(backBoolBlock)backBlock{
    
    if (![DZMobileCtrl sharedCtrl].isLogin) {
        return;
    }
//    广告垃圾 恶意灌水 重复发帖 政治敏感 黄赌毒骗 其他违规
    NSString *userId = [DZMobileCtrl sharedCtrl].User.user_id;
    [[DZNetCenter center] dzx_threadReportWithUser:userId thread:threadId reason:@"其他违规" completion:^(NSArray<DZQDataPost *> * _Nonnull varModel, BOOL success) {
        KSLog(@"WBS 举报接口未拆分~~~");
    }];
}

// 主题 删除
+ (void)thread_deleteCellAction:(NSString *)threadId block:(backBoolBlock)backBlock{
    
    [[DZNetCenter center] dzx_threadDeleteWithThread:threadId completion:^(DZQDataThread * _Nonnull varModel, BOOL success) {
        NSLog(@"");
    }];
}

// 话题详情
+ (void)thread_TopicDetailAction:(NSString *)topicId{
    [[DZMobileCtrl sharedCtrl] PushToTopicDetailController:topicId];
}

// 作者个人中心
+ (void)thread_UserCenterCellAction:(NSString *)user_id{
    KSLog(@"WBS 个人中心~~~");
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:user_id];
}


// 主题 分类相关板块
+ (void)thread_CategoryCenterCellAction:(DZThreadCateM *)cateModel{
    KSLog(@"WBS 分类~~~");
    [[DZMobileCtrl sharedCtrl] PushToForumCateController:cateModel];
}

// 主题 附件 被点击
+ (void)thread_attachFileCellTapAction:(DZQDataAttachment *)attachDataModel{
    KSLog(@"WBS 附件 被点击~~~");
}

// 主题管理（更多：分享 举报）
+ (void)thread_MoreCellAction:(DZQDataThread *)thread sender:(UIButton *)sender{
    
    KSLog(@"WBS 更多~~~");
    NSArray *titleArray = thread.attributes.canHide ? @[@"举报",@"分享",@"删除"] : @[@"举报",@"分享"];
    [[DZMobileCtrl sharedCtrl].moreMenu showNaviBarPopTextMenu:sender titleArray:titleArray doneBlock:^(NSInteger index) {
        if (index == 0) {
            [[DZMobileCtrl sharedCtrl] complainActionWithThreadId:thread.inner_id];
        }else if (index == 1){
            [[DZMobileCtrl sharedCtrl] shareThreadActionWithModel:thread];
        }else if (index == 2){
            // 删除主题
            [[DZMobileCtrl sharedCtrl] deleteThreadActionWithModel:thread];
        }
    } dismissBlock:^{
    }];
}

// 主题 付费 或 打赏用户列表
+ (void)thread_rewardOrPayListAction:(DZQPostV1 *)postModel{
    
    KSLog(@"WBS 打赏 付费列表~~~");
    
}

// 给主题 付费 或 打赏
+ (void)thread_rewardOrPayButtonAction:(DZQPostV1 *)postModel{
     KSLog(@"WBS 给 主题 进行打赏 付费~~~");
}

// 点击 图片九宫格
+ (void)touchThreadPicSquareData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index{
    
    [[DZMediaBrowser Shared] browserSquareWithData:attachArray DidSelectItem:index];
    
}


#pragma mark ====  【【【【【【 主题的回复 】】】】】相关操作


/// 评论 回复
+ (void)post_CommentCellAction:(DZQPostV1 *)postModel{
   
    KSLog(@"WBS 回复 === 评论~~~");
}


/// 点赞回复
+ (void)post_LikeCellAction:(DZQPostV1 *)postModel block:(backBoolBlock)backBlock{
    
    [self.class thread_LikeCellAction:postModel block:backBlock];
}


@end
