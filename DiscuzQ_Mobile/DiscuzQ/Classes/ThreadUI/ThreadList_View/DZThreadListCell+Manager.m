//
//  DZThreadListCell+Manager.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"
#import "DZThreadTHelper.h"

@implementation DZThreadListCell (Manager)

-(void)configThreadCellManager{
    
    [self.cellView configBaseAction:self avatar:@selector(avatarButtonAction:) more:@selector(moreButtonAction:) like:@selector(likeButtonAction:) reply:@selector(replyButtonAction:) share:@selector(shareButtonAction:)];
    
}

-(DZQPostModel *)barData{
    return self.cellModel.relationships.firstPost.attributes;
}
// 点击头像
-(void)avatarButtonAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:self.cellModel.relationships.user.type_id];
}

-(void)moreButtonAction:(UIButton *)button{
    
    
    DZQPostModel *postModel = [self barData];
    
    [DZThreadTHelper thread_MoreCellAction:postModel];
    
}

// 点赞
-(void)likeButtonAction:(UIButton *)button{
    
    DZQPostModel *postModel = [self barData];
    
    [DZThreadTHelper thread_LikeCellAction:postModel];
    
}

// 评论
-(void)replyButtonAction:(UIButton *)button{
    
    DZQPostModel *postModel = [self barData];
    
    [DZThreadTHelper thread_CommentCellAction:postModel];
    
}

// 分享
-(void)shareButtonAction:(UIButton *)button{
    
    DZQPostModel *postModel = [self barData];
    [DZThreadTHelper thread_SharedCellAction:postModel];
}



@end
