//
//  DZThreadContent.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadContent.h"
#import "DZThreadArticle.h"
#import "DZThreadVideo.h"
#import "DZThreadListStyle.h"

@interface DZThreadContent ()

@property (nonatomic, strong) DZThreadArticle *articleView;  //!< 长段文章
@property (nonatomic, strong) DZThreadNormal *normalTopic;  //!< 正常主题（纯文字 或者 文字 + 图片）
@property (nonatomic, strong) DZThreadVideo *videoView;  //!< 视频主题（纯视频 或者 文字 + 视频）

@end

@implementation DZThreadContent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        [self addSubview:self.videoView];
        [self addSubview:self.normalTopic];
        [self addSubview:self.articleView];
    }
    return self;
}

- (void)updateThreadContent:(DZQDataThread *)Model contentStyle:(DZDHeadStyle *)contentStyle{
    
    
    [self.videoView updateThreadVideo:Model style:contentStyle];
    [self.normalTopic updateThreadNormal:Model.relationships.firstPost.relationships style:contentStyle.frame_content];
    [self.articleView updateThreadArticle:Model style:contentStyle];
    
    [self layoutContentSubviews:Model.attributes.type];
    
}

// 文章类型(0 普通 1 长文 2 视频)
-(void)layoutContentSubviews:(NSInteger)frametype{
    
    self.articleView.frame = self.bounds;
    self.normalTopic.frame = self.bounds;
    self.videoView.frame = self.bounds;
    
    self.normalTopic.hidden = (frametype == 0) ? NO : YES;
    self.articleView.hidden = (frametype == 1) ? NO : YES;
    self.videoView.hidden = (frametype == 2) ? NO : YES;
    
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
