//
//  DZThreadListCell+Manager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"
#import "DZThreadHelper.h"

@implementation DZThreadListCell (Manager)

-(void)configThreadCellManager{
    
    [self.userHeader configHeadAction:self avatar:@selector(avatarButtonAction:) more:@selector(moreButtonAction:) follow:nil];
    
    [self.bottomToolBar configToolBarAction:self left:@selector(leftButtonAction:) center:@selector(centerButtonAction:) right:@selector(rightButtonAction:)];
}

-(DZQPostV1 *)barData{
    return self.cellModel.relationships.firstPost.attributes;
}
// 点击头像
-(void)avatarButtonAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:self.cellModel.relationships.user.inner_id];
}

-(void)moreButtonAction:(UIButton *)button{
    
    [DZThreadHelper thread_MoreCellAction:self.cellModel sender:button];
    
}

// 点赞
-(void)leftButtonAction:(UIButton *)button{
    
    DZQPostV1 *postModel = [self barData];
    
    [DZThreadHelper thread_LikeCellAction:postModel block:^(BOOL boolState) {
        button.selected = boolState;
    }];
    
}

// 评论
-(void)centerButtonAction:(UIButton *)button{
    
    DZQPostV1 *postModel = [self barData];
    
    [DZThreadHelper post_CommentCellAction:postModel];
    
}

// 分享
-(void)rightButtonAction:(UIButton *)button{
    
    DZQPostV1 *postModel = [self barData];
    [DZThreadHelper post_CommentCellAction:postModel];
}



@end
