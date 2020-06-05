//
//  DZThreadListCell+Manager.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadListCell+Manager.h"
#import "DZShareCenter.h"

@implementation DZThreadListCell (Manager)

-(void)configThreadCellManager{
    
    [self.cellView configBaseAction:self avatar:@selector(avatarButtonAction:) more:@selector(moreButtonAction:) like:@selector(likeButtonAction:) reply:@selector(replyButtonAction:) share:@selector(shareButtonAction:)];
    
}

// 点击头像
-(void)avatarButtonAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:self.cellModel.relationships.user.type_id];
}

-(void)moreButtonAction:(UIButton *)button{
    
    KSLog(@"WBS 更多~~~");
    
}

// 点赞
-(void)likeButtonAction:(UIButton *)button{
    
    KSLog(@"WBS 点赞~~~");
    
}

// 评论
-(void)replyButtonAction:(UIButton *)button{
    
    KSLog(@"WBS 评论~~~");
}

// 分享
-(void)shareButtonAction:(UIButton *)button{
    
    [DZShareCenter shareActionWithModel:nil];
}



@end
