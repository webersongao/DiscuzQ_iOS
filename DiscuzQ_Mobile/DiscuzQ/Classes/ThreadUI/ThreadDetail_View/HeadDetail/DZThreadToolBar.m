//
//  DZThreadToolBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadToolBar.h"

@interface DZThreadToolBar ()

@end

@implementation DZThreadToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_ThreadToolBar];
        self.backgroundColor = KRandom_Color;
    }
    return self;
}


-(void)config_ThreadToolBar{
    
    [self.shareButton removeFromSuperview];
    
    self.likeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.replyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
}

-(void)updateDetailToolBar:(DZDToolBarStyle *)toolLayout{

    // 更新布局
    self.likeButton.frame = toolLayout.kf_right;
    self.replyButton.frame = toolLayout.kf_right;
    self.bottomLine.frame = toolLayout.kf_barLine;
    
}





@end
