//
//  DZPostCommentBar.m
//  DiscuzQ
//
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
        self.backgroundColor = KRandom_Color;
    }
    return self;
}


-(void)config_CommentBar{
    
    [self addSubview:self.timeLabel];
    [self.shareButton removeFromSuperview];
    
    self.likeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
}

-(void)updateCommentBar:(NSString *)timeString layout:(DZDToolBarStyle *)toolLayout{
    
    self.timeLabel.text = timeString;
    
    
    
    // 更新布局
    self.timeLabel.frame = toolLayout.kf_left;
    self.likeButton.frame = toolLayout.kf_center;
    self.replyButton.frame = toolLayout.kf_right;
    self.bottomLine.frame = toolLayout.kf_barLine;
    
}


- (DZLabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(14.f) textAlignment:NSTextAlignmentLeft];
    }
    return _timeLabel;
}




@end
