//
//  DZPostCommentView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostCommentView.h"
#import "DZHtmlLabel.h"
#import "DZThreadNormal.h"
#import "DZDDetailStyle.h"
#import "DZBaseUserInfoBar.h"
#import "DZPostCommentBar.h"
#import "DZThreadTHelper.h"

@interface DZPostCommentView ()

@property (nonatomic, strong) DZBaseUserInfoBar *postUserbar;  //!< 用户信息
@property (nonatomic, strong) DZThreadNormal *postContent;  //!< 回复内容(文字 + 图片)
@property (nonatomic, strong) DZPostCommentBar *postToolBar;  //!< 评论 点赞工具条

@end

@implementation DZPostCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_CommentView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_CommentView{
    
    [self addSubview:self.postUserbar];
    [self addSubview:self.postContent];
    [self addSubview:self.postToolBar];
    
    [self.postToolBar configToolBarAction:self like:@selector(likePostAction) reply:@selector(replyPostAction) share:nil];
}

-(void)updatePostComment:(DZQDataPost *)dataPost style:(DZDPostCellStyle *)postStyle{
    
    [self.postUserbar updateUserBar:postStyle.frame_post_user.nameAttributedString avatar:dataPost.relationships.user.attributes.avatarUrl time:dataPost.attributes.createdAt real:NO style:postStyle.frame_post_user];
    
    [self.postContent updateThreadNormal:dataPost.relationships style:postStyle.frame_post_content];
    
    [self.postToolBar updateCommentBar:dataPost layout:postStyle.frame_post_toolBar];
    
    [self layoutMyCommentView:postStyle];
}

-(void)layoutMyCommentView:(DZDPostCellStyle *)postStyle{
    
    self.postUserbar.frame = postStyle.kf_post_user;
    self.postContent.frame = postStyle.kf_post_content;
    self.postToolBar.frame = postStyle.kf_post_toolBar;
    
}

-(void)likePostAction{
    
    [DZThreadTHelper thread_LikeCellAction:nil];
}

-(void)replyPostAction{
    
    [DZThreadTHelper thread_CommentCellAction:nil];
    
}

-(DZBaseUserInfoBar *)postUserbar{
    if (!_postUserbar) {
        _postUserbar = [[DZBaseUserInfoBar alloc] initWithFrame:CGRectZero];
    }
    return _postUserbar;
}

-(DZThreadNormal *)postContent{
    if (!_postContent) {
        _postContent = [[DZThreadNormal alloc] initWithFrame:CGRectZero];
    }
    return _postContent;
}

-(DZPostCommentBar *)postToolBar{
    if (!_postToolBar) {
        _postToolBar = [[DZPostCommentBar alloc] initWithFrame:CGRectZero];
    }
    return _postToolBar;
}


@end
