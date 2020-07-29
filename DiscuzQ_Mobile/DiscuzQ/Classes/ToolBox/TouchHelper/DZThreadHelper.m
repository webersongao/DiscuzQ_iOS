//
//  DZThreadHelper.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadHelper.h"
#import "DZShareCenter.h"

@implementation DZThreadHelper

// 点赞主题
+ (void)thread_LikeCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 点赞~~~");
    
}

// 评论主题
+ (void)thread_CommentCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 评论~~~");
    
}

// 分享主题
+ (void)thread_SharedCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 分享~~~");
    
    [[DZMobileCtrl sharedCtrl] shareThreadActionWithModel:nil];
}

// 主题 收藏
+ (void)thread_FavoriteCellAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 收藏~~~");
    
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
+ (void)thread_CategoryCenterCellAction:(DZQDataCate *)cateModel{
    KSLog(@"WBS 分类~~~");
    [[DZMobileCtrl sharedCtrl] PushToForumCateController:cateModel];
}

// 主题 附件 被点击
+ (void)thread_attachFileCellTapAction:(DZQDataAttachment *)attachDataModel{
    KSLog(@"WBS 附件 被点击~~~");
}

// 主题管理（更多）
+ (void)thread_MoreCellAction:(DZQPostModel *)postModel sender:(UIButton *)sender{
    
    KSLog(@"WBS 更多~~~");
    [[DZMobileCtrl sharedCtrl].moreMenu showNaviBarPopTextMenu:sender titleArray:@[@"举报",@"分享"] doneBlock:^(NSInteger index) {
        if (index == 0) {
            [[DZMobileCtrl sharedCtrl] complainActionWithThreadId:nil];
        }else if (index == 1){
            [[DZMobileCtrl sharedCtrl] shareThreadActionWithModel:nil];
        }
    } dismissBlock:^{
    }];
}

// 主题 付费 或 打赏用户列表
+ (void)thread_rewardOrPayListAction:(DZQPostModel *)postModel{
    
    KSLog(@"WBS 打赏 付费列表~~~");
    
}

// 给主题 付费 或 打赏
+ (void)thread_rewardOrPayButtonAction:(DZQPostModel *)postModel{
     KSLog(@"WBS 给 主题 进行打赏 付费~~~");
}

// 点击 图片九宫格
+ (void)touchThreadPicSquareData:(NSArray<YBIBImageData *> *)attachArray DidSelectItem:(NSInteger)index{
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = attachArray;
    browser.currentPage = index;
    [browser show];
    
}




@end
