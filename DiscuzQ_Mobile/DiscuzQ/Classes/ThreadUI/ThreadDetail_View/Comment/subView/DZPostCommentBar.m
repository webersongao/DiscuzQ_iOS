//
//  DZPostCommentBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPostCommentBar.h"

@interface DZPostCommentBar ()

@property (nonatomic, strong) DZLabel *timeLabel;  //!< 回复发布时间（在左侧）
@end


@implementation DZPostCommentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_CommentBar];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_CommentBar{
    
    [self addSubview:self.timeLabel];
    [self.rightButton removeFromSuperview];
    
    self.leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.centerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
}

-(void)updateCommentBar:(DZQDataPost *)dataPost layout:(DZDToolBarStyle *)toolLayout{
    
    self.timeLabel.text = dataPost.attributes.ip;
    self.leftButton.selected = dataPost.attributes.isLiked;
    [self.leftButton setTitle:checkIntegerStr(dataPost.attributes.likeCount) forState:UIControlStateNormal];
    [self.centerButton setTitle:checkIntegerStr(dataPost.attributes.replyCount) forState:UIControlStateNormal];
    
    [self layoutBarWithlayout:toolLayout];
}

// 更新布局
-(void)layoutBarWithlayout:(DZDToolBarStyle *)toolLayout{
    
    self.leftButton.frame = toolLayout.kf_right;
    self.centerButton.frame = toolLayout.kf_center;
    self.bottomLine.frame = toolLayout.kf_barLine;
    
    self.leftButton.frame = CGRectMake(toolLayout.kf_right.origin.x, 0, toolLayout.kf_left.size.width-kMargin15, toolLayout.kf_left.size.height);
    self.timeLabel.frame = CGRectMake(kMargin15, 0, toolLayout.kf_left.size.width-kMargin15, toolLayout.kf_left.size.height);
}


- (DZLabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(14.f) textAlignment:NSTextAlignmentLeft];
    }
    return _timeLabel;
}




@end
