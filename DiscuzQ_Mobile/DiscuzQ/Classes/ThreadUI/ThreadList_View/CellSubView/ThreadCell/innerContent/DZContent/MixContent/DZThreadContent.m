//
//  DZThreadContent.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadContent.h"
#import "DZThreadArticle.h"
#import "DZThreadListStyle.h"
#import "DZThreadPicture.h"
#import "DZThreadAudio.h"
#import "DZThreadGoods.h"
#import "DZThreadQuestion.h"

@interface DZThreadContent ()

@property (nonatomic, strong) DZThreadArticle *articleView;  //!< 长段文章
@property (nonatomic, strong) DZThreadPicture *pictureView;  //!< 图片主题
@property (nonatomic, strong) DZThreadNormal *normalTopic;  //!< 正常主题（文字）
@property (nonatomic, strong) DZThreadVideo *videoView;  //!< 视频主题（文字 + 视频）
@property (nonatomic, strong) DZThreadAudio *audioView;  //!< 音频主题
@property (nonatomic, strong) DZThreadGoods *goodsView;  //!< 商品主题
@property (nonatomic, strong) DZThreadQuestion *questionView;  //!< 问答主题

@end

@implementation DZThreadContent

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.videoView];
        [self addSubview:self.normalTopic];
        [self addSubview:self.articleView];
        [self addSubview:self.pictureView];
        [self addSubview:self.audioView];
        [self addSubview:self.goodsView];
        [self addSubview:self.questionView];
        [self config_ThreadContentAction];
    }
    return self;
}

-(void)config_ThreadContentAction{
    
    KWEAKSELF
    self.videoView.playBlock = ^(DZMediaPlayView * button, DZQDataVideo * dataVideo) {
        if ([weakSelf.actionDelegate respondsToSelector:@selector(threadContent:playAction:)]) {
            [weakSelf.actionDelegate threadContent:button playAction:dataVideo];
        }
    };
    
    self.audioView.playBlock = ^(DZMediaPlayView * button, DZQDataVideo * dataVideo) {
        if ([weakSelf.actionDelegate respondsToSelector:@selector(threadContent:playAction:)]) {
            [weakSelf.actionDelegate threadContent:button playAction:dataVideo];
        }
    };
}

- (void)updateThreadContent:(DZQDataThread *)Model contentStyle:(DZDHeadStyle *)contentStyle{
    
    NSInteger frametype = Model.attributes.type;
    
    if (frametype == 0){
        DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
        [self.normalTopic updateThreadNormal:relateModel style:contentStyle.frame_content];
    }else if (frametype == 1) {
        [self.articleView updateThreadArticle:Model style:contentStyle];
    }else if (frametype == 2){
        [self.videoView updateThreadVideo:Model style:contentStyle];
    }else if (frametype == 3){
        DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
        [self.pictureView updateThreadPicture:relateModel style:contentStyle.frame_content];
    }else if (frametype == 4){
        [self.audioView updateThreadAudio:Model style:contentStyle];
    }else if (frametype == 5){
        [self.questionView updateThreadQuestion:Model style:contentStyle.frame_content];
    }else if (frametype == 6){
        DZQPostRelationV1 *relateModel = Model.relationships.firstPost.relationships;
        [self.goodsView updateThreadGoods:relateModel style:contentStyle.frame_content];
    }
    
    [self layoutContentSubviews:frametype frame:contentStyle.kf_content];
    
}

// 文章类型(0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖)
-(void)layoutContentSubviews:(NSInteger)frametype frame:(CGRect)frame{
    
    self.articleView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.normalTopic.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.videoView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.pictureView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.audioView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.questionView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.goodsView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    self.normalTopic.hidden = (frametype == 0) ? NO : YES;
    self.articleView.hidden = (frametype == 1) ? NO : YES;
    self.videoView.hidden = (frametype == 2) ? NO : YES;
    self.pictureView.hidden = (frametype == 3) ? NO : YES;
    self.audioView.hidden = (frametype == 4) ? NO : YES;
    self.questionView.hidden = (frametype == 5) ? NO : YES;
    self.goodsView.hidden = (frametype == 6) ? NO : YES;
    
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

-(DZThreadPicture *)pictureView{
    if (!_pictureView) {
        _pictureView = [[DZThreadPicture alloc] initWithFrame:CGRectZero];
    }
    return _pictureView;
}

-(DZThreadArticle *)articleView{
    if (!_articleView) {
        _articleView = [[DZThreadArticle alloc] initWithFrame:CGRectZero];
    }
    return _articleView;
}

-(DZThreadAudio *)audioView{
    if (!_audioView) {
        _audioView = [[DZThreadAudio alloc] initWithFrame:CGRectZero];
    }
    return _audioView;
}

-(DZThreadGoods *)goodsView{
    if (!_goodsView) {
        _goodsView = [[DZThreadGoods alloc] initWithFrame:CGRectZero];
    }
    return _goodsView;
}

-(DZThreadQuestion *)questionView{
    if (!_questionView) {
        _questionView = [[DZThreadQuestion alloc] initWithFrame:CGRectZero];
    }
    return _questionView;
}



@end
