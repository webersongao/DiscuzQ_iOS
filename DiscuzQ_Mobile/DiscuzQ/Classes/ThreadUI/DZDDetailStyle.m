//
//  DZDDetailStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDDetailStyle.h"

@implementation DZDHeadStyle

// 计算 空间高度 宽度等
- (instancetype)DHeadStyle:(DZQDataThread *)dataModel cellWidth:(CGFloat)cellWidth maxWidth:(CGFloat)cellContenMaxWidth{

    // 第一部分 用户基本信息
    self.frame_user = [DZDUserStyle DUserStyle:cellWidth basic:NO];
    self.kf_head = CGRectMake(0, 0, cellWidth, self.frame_user.kf_UserHeight);
    
    
    // 第一部分 主题内容高度
    self.frame_content = [DZDContentStyle  DThreadContentStyleWithMaxW:cellContenMaxWidth cellWidth:cellWidth dataModel:dataModel];
    self.kf_content = CGRectMake(0, CGRectGetMaxY(self.kf_head), cellWidth, self.frame_content.kf_ContentHeight);
    
    
    //    // 第三部分 转评赞 工具条
    self.frame_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
    self.kf_toolBar = CGRectMake(0, CGRectGetMaxY(self.kf_content), cellWidth, self.frame_toolBar.kf_ToolBarHeight);
    
    CGFloat headeHeight = self.kf_head.size.height + self.kf_content.size.height + self.kf_toolBar.size.height;
    
    self.kf_HeadSize = CGSizeMake(cellWidth, headeHeight);
    
    return self;
}

@end


@implementation DZDSectionStyle

+(instancetype)DSectionStyle:(CGFloat)cellWidth like:(NSInteger)likeCount reward:(NSInteger)rewardCount{
    
    DZDSectionStyle *style = [[DZDSectionStyle alloc] init];
    
    style.kf_Line = CGRectMake(0, 0, cellWidth, kMargin10);
    
    CGFloat likeH = likeCount ? (kMargin30 + kMargin10) : 0;
    CGFloat rewardH = rewardCount ? (kMargin30 + kMargin10) : 0;
    CGFloat bottomLineH = (likeCount || rewardCount) ? kMargin5 : 0;
     // 这个布局 跟  userListLayout  有密切关系 
    style.kf_oneList = CGRectMake(0, CGRectGetMaxY(style.kf_Line), cellWidth, likeH);
    style.kf_twoList = CGRectMake(0, CGRectGetMaxY(style.kf_oneList), cellWidth, rewardH);
    style.kf_bottomLine = CGRectMake(0, CGRectGetMaxY(style.kf_twoList), cellWidth, bottomLineH);
    
    // 计算总的高度
    style.kf_SectionSize = CGSizeMake(cellWidth, CGRectGetMaxY(style.kf_bottomLine));
    
    return style;
}




@end







