//
//  DZThreadCateBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadCateBar.h"

@implementation DZThreadCateBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_ThreadToolBar];
    }
    return self;
}


-(void)config_ThreadToolBar{
    
    [self.bottomLine removeFromSuperview];
    [self.replyButton removeFromSuperview];
    [self.shareButton removeFromSuperview];
    
    self.likeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    self.likeButton.layer.cornerRadius = 3.f;
    self.likeButton.layer.masksToBounds = YES;
    self.likeButton.titleLabel.font = KFont(14.f);
    self.likeButton.backgroundColor = KDarkLine_Color;
    [self.likeButton setTitleColor:KGray_Color forState:UIControlStateNormal];
    [self.likeButton setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
    [self.likeButton setImage:KImageNamed(@"dz_list_cate") forState:UIControlStateNormal];
    [self.likeButton setImage:KImageNamed(@"dz_list_cate_h") forState:UIControlStateHighlighted];
    
}

-(void)updateDetailCategoryBar:(DZQDataCate *)cateModel toolLayout:(DZDToolBarStyle *)toolLayout{
    
    // 更新布局
    self.likeButton.frame = CGRectMake(kMargin15, 0, toolLayout.kf_right.size.width-kMargin15, toolLayout.kf_right.size.height);
    
    NSString *cateName = checkNull(cateModel.attributes.name);
    self.likeButton.hidden = cateName.length ? NO : YES;
    [self.likeButton setTitle:cateName forState:UIControlStateNormal];
    [self.likeButton setTitle:cateName forState:UIControlStateHighlighted];
    
}

@end
