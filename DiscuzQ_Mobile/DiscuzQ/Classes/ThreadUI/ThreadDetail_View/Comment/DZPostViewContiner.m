//
//  DZPostViewContiner.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostViewContiner.h"
#import "DZHtmlLabel.h"
#import "DZPostContentView.h"
#import "DZDDetailStyle.h"
#import "DZBaseUserInfoBar.h"
#import "DZPostCommentBar.h"
#import "DZThreadHelper.h"

@interface DZPostViewContiner ()

@property (nonatomic, strong) DZQDataPost *dataPost;  //!< 用户信息
@property (nonatomic, strong) DZBaseUserInfoBar *postUserbar;  //!< 用户信息
@property (nonatomic, strong) DZPostContentView *postContent;  //!< 回复内容(文字 + 图片)
@property (nonatomic, strong) DZPostCommentBar *postToolBar;  //!< 评论 点赞工具条

@end

@implementation DZPostViewContiner

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
    
    [self.postUserbar.avatar addTarget:self action:@selector(userInfoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.postToolBar configToolBarAction:self left:@selector(likePostAction:) center:@selector(replyPostAction:) right:nil];
}

-(void)updatePostContiner:(DZQDataPost *)dataPost style:(DZDPostCellStyle *)postStyle{
    
    self.dataPost = dataPost;
    [self.postUserbar updateUserBar:postStyle.frame_post_user.nameAttributedString avatar:dataPost.relationships.user.attributes.avatarUrl time:dataPost.attributes.createdAt real:NO style:postStyle.frame_post_user];
    
    [self.postContent updatePostContent:dataPost.relationships style:postStyle.frame_post_content];
    
    [self.postToolBar updateCommentBar:dataPost layout:postStyle.frame_post_toolBar];
    
    [self layoutMyCommentView:postStyle];
}

-(void)layoutMyCommentView:(DZDPostCellStyle *)postStyle{
    
    self.postUserbar.frame = postStyle.kf_post_user;
    self.postContent.frame = postStyle.kf_post_content;
    self.postToolBar.frame = postStyle.kf_post_toolBar;
    
}


-(void)userInfoAction:(UIButton *)button{
    
    [DZThreadHelper thread_UserCenterCellAction:self.dataPost.relationships.user.attributes.user_id];
}

-(void)likePostAction:(UIButton *)button{
    
    [DZThreadHelper post_LikeCellAction:self.dataPost.attributes block:^(BOOL boolState) {
        button.selected = boolState;
    }];
}

-(void)replyPostAction:(UIButton *)button{
    
    [DZThreadHelper post_CommentCellAction:self.dataPost.attributes];
    
}

-(DZBaseUserInfoBar *)postUserbar{
    if (!_postUserbar) {
        _postUserbar = [[DZBaseUserInfoBar alloc] initWithFrame:CGRectZero];
    }
    return _postUserbar;
}

-(DZPostContentView *)postContent{
    if (!_postContent) {
        _postContent = [[DZPostContentView alloc] initWithFrame:CGRectZero];
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
