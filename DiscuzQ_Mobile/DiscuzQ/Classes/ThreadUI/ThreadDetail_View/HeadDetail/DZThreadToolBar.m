//
//  DZThreadToolBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadToolBar.h"

@interface DZThreadToolBar ()

@property (nonatomic, strong) DZLabel *viewCountLabel;  //!< 回复总数量（在左侧）

@end

@implementation DZThreadToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_ThreadToolBar];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}


-(void)config_ThreadToolBar{
    
    [self.likeButton removeFromSuperview];
    [self.replyButton removeFromSuperview];
    
    [self addSubview:self.viewCountLabel];
    self.shareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [self.shareButton setTitle:@"收藏" forState:UIControlStateNormal];
    [self.shareButton setTitle:@"已收藏" forState:UIControlStateSelected];
    [self.shareButton setTitle:@"收藏" forState:UIControlStateHighlighted];
    [self.shareButton setTitleColor:KHight_Color forState:UIControlStateSelected];
    [self.shareButton setImage:KImageNamed(@"dz_list_love") forState:UIControlStateNormal];
    [self.shareButton setImage:KImageNamed(@"dz_list_love_h") forState:UIControlStateSelected];
    [self.shareButton setImage:KImageNamed(@"dz_list_love") forState:UIControlStateHighlighted];
}

-(void)updateDetailToolBar:(DZQDataThread *)Model toolLayout:(DZDToolBarStyle *)toolLayout{
    
    // 更新布局
    self.bottomLine.frame = toolLayout.kf_barLine;
    self.shareButton.frame = CGRectMake(toolLayout.kf_right.origin.x, 0, toolLayout.kf_right.size.width-kMargin15, toolLayout.kf_right.size.height);
    
    self.viewCountLabel.text = checkTwoStr(@"阅读:", checkInteger(Model.attributes.viewCount));
    self.viewCountLabel.frame = CGRectMake(kMargin15, 0, toolLayout.kf_left.size.width-kMargin15, toolLayout.kf_left.size.height);
}


- (DZLabel *)viewCountLabel{
    if (!_viewCountLabel) {
        _viewCountLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGray_Color font:KFont(14.f) textAlignment:NSTextAlignmentLeft];
    }
    return _viewCountLabel;
}


@end
