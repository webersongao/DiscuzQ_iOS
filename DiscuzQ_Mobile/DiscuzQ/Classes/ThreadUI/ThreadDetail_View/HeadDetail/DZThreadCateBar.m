//
//  DZThreadCateBar.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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
    [self.centerButton removeFromSuperview];
    
    self.leftButton.layer.cornerRadius = 3.f;
    self.leftButton.layer.masksToBounds = YES;
    self.leftButton.titleLabel.font = KFont(12.f);
    self.leftButton.backgroundColor = KDarkLine_Color;
    [self.leftButton setTitleColor:KGray_Color forState:UIControlStateNormal];
    [self.leftButton setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
    self.leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.leftButton setImage:KImageNamed(@"dz_list_cate") forState:UIControlStateNormal];
    [self.leftButton setImage:KImageNamed(@"dz_list_cate_h") forState:UIControlStateHighlighted];
    
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(kMargin5, kMargin10, kMargin5, kMargin10);
    
    
    
    
    self.rightButton.layer.cornerRadius = 3.f;
    self.rightButton.layer.masksToBounds = YES;
    self.rightButton.titleLabel.font = KFont(12.f);
//    self.rightButton.backgroundColor = KDarkLine_Color;
    [self.rightButton setTitleColor:KGray_Color forState:UIControlStateNormal];
    [self.rightButton setTitleColor:KGreen_Color forState:UIControlStateHighlighted];
    self.rightButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.rightButton setImage:KImageNamed(@"dz_list_location") forState:UIControlStateNormal];
    [self.rightButton setImage:KImageNamed(@"dz_list_location_h") forState:UIControlStateHighlighted];
    self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(kMargin5, kMargin10, kMargin5, 0);
    
}

-(void)updateDetailBarCate:(NSString *)cateName location:(NSString *)location Layout:(DZDToolBarStyle *)toolLayout{
    
    // 更新布局
    self.leftButton.frame = CGRectMake(kMargin15, 0, toolLayout.kf_right.size.width-kMargin15, toolLayout.kf_right.size.height);
    
    self.leftButton.hidden = cateName.length ? NO : YES;
    [self.leftButton setTitle:cateName forState:UIControlStateNormal];
    [self.leftButton setTitle:cateName forState:UIControlStateHighlighted];

    [self.leftButton sizeToFit];
    
    
    self.rightButton.hidden = location.length ? NO : YES;
    [self.rightButton setTitle:location forState:UIControlStateNormal];
    [self.rightButton setTitle:location forState:UIControlStateHighlighted];
    self.rightButton.frame = CGRectMake(self.width/2.0, 0, self.width/2.0-kMargin15, toolLayout.kf_right.size.height);
    
    [self.rightButton sizeToFit];
    self.rightButton.right = self.width - kMargin15;
}

@end
