//
//  DZThreadContent.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadContent.h"
#import "DZThreadArticle.h"
#import "DZThreadListStyle.h"

@interface DZThreadContent ()

@property (nonatomic, strong) DZThreadArticle *articleView;  //!< 长段文章
@property (nonatomic, strong) DZThreadNormal *normalTopic;  //!< 正常主题（文字 + 图片）
@property (nonatomic, strong) DZThreadVideo *videoView;  //!< 视频主题（文字 + 视频）

@end

@implementation DZThreadContent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.videoView];
        [self addSubview:self.normalTopic];
        [self addSubview:self.articleView];
        [self config_ThreadContentAction];
    }
    return self;
}

-(void)config_ThreadContentAction{
    
    KWEAKSELF
    self.videoView.playBlock = ^(DZVideoPicView * button, DZQDataVideo * dataVideo) {
        if ([weakSelf.actionDelegate respondsToSelector:@selector(threadContent:playAction:)]) {
            [weakSelf.actionDelegate threadContent:button playAction:dataVideo];
        }
    };
}

- (void)updateThreadContent:(DZQDataThread *)Model contentStyle:(DZDHeadStyle *)contentStyle{
    
    NSInteger frametype = Model.attributes.type;
    
    if (frametype == 1) {
        [self.articleView updateThreadArticle:Model style:contentStyle];
    }else if (frametype == 2){
        [self.videoView updateThreadVideo:Model style:contentStyle];
    }else if (frametype == 0 || frametype == 3){
        [self.normalTopic updateThreadNormal:Model.relationships.firstPost.relationships style:contentStyle.frame_content];
    }
    
    [self layoutContentSubviews:frametype frame:contentStyle.kf_content];
    
}

// 文章类型(0 普通 1 长文 2 视频 3 图片)
-(void)layoutContentSubviews:(NSInteger)frametype frame:(CGRect)frame{
    
    self.articleView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.normalTopic.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.videoView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    self.articleView.hidden = (frametype == 1) ? NO : YES;
    self.videoView.hidden = (frametype == 2) ? NO : YES;
    self.normalTopic.hidden = (frametype == 0 || frametype == 3) ? NO : YES;
    
}

-(DZThreadVideo *)videoView{
    if (!_videoView) {
        _videoView = [[DZThreadVideo alloc] initWithFrame:CGRectZero];
    }
    return _videoView;
}

-(DZThreadNormal *)normalTopic{
    if (!_normalTopic) {
        _normalTopic = [[DZThreadNormal alloc] initWithFrame:CGRectZero];
    }
    return _normalTopic;
}

-(DZThreadArticle *)articleView{
    if (!_articleView) {
        _articleView = [[DZThreadArticle alloc] initWithFrame:CGRectZero];
    }
    return _articleView;
}



@end
