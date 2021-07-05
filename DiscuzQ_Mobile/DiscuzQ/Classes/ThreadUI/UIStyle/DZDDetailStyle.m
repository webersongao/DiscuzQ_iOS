//
//  DZDDetailStyle.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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
    self.frame_content = [DZDContentStyle  DThreadContentStyleWithMaxW:cellContenMaxWidth cellWidth:cellWidth dataModel:dataModel isDetail:YES];
    self.kf_content = CGRectMake(0, CGRectGetMaxY(self.kf_head), cellWidth, self.frame_content.kf_ContentHeight);
    
    
    // 第三部分 转评赞 工具条
    self.frame_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
    self.kf_toolBar = CGRectMake(0, CGRectGetMaxY(self.kf_content), cellWidth, self.frame_toolBar.kf_ToolBarHeight);
    
    CGFloat headeHeight = self.kf_head.size.height + self.kf_content.size.height + self.kf_toolBar.size.height;
    
    self.kf_HeadSize = CGSizeMake(cellWidth, headeHeight);
    
    return self;
}

@end


@implementation DZDPayStyle

+(instancetype)DZQDetailPayStyle:(CGFloat)cellWidth payOrReward:(NSInteger)payOrReCount{
    
    DZDPayStyle *style = [[DZDPayStyle alloc] init];
    
        CGFloat selfMaxW = (cellWidth - kMargin30);
    
    style.kf_PayButton = CGRectMake(0, 0, selfMaxW, kMargin35);
    style.kf_infoLabel = CGRectMake(0, CGRectGetMaxY(style.kf_PayButton)+kMargin15, selfMaxW, kMargin20);
    
    // 行间距 (上下间隔)
    style.UMinimumLine = kMargin5;
    // 列间距 (左右间隔)
    style.UMinimumInteritem = kMargin5;
    // (最多三张图，间距为5 合计为10)
    CGFloat itemWH = kToolBarHeight/2.0;
    style.USectionEdge = UIEdgeInsetsZero;
    
    style.UitemSize = CGSizeMake(itemWH, itemWH);
    // 一行多少个
    CGFloat columnNumber = (selfMaxW / (style.UMinimumInteritem + itemWH));
    // 多少行（最多3行）
    NSInteger rowNumber = ((ceilf(payOrReCount/columnNumber)) > 3) ? 3 : ceilf(payOrReCount/columnNumber);
    
    CGFloat listHeight = ((rowNumber * (itemWH + style.UMinimumLine)) - style.UMinimumInteritem);
    
    style.kf_PayUserList = CGRectMake(0, CGRectGetMaxY(style.kf_infoLabel) + kMargin10, selfMaxW, listHeight);
    
    CGFloat foldBtnHeight = (rowNumber > 1) ? kMargin30 : 0;
    // 超过1行，才显示展开按钮
    style.kf_foldButton = CGRectMake((selfMaxW - kMargin30)/2.0, CGRectGetMaxY(style.kf_PayUserList) + kMargin15, kMargin30, foldBtnHeight);
    
    style.kf_PayViewSize = CGSizeMake(cellWidth, (payOrReCount ? CGRectGetMaxY(style.kf_foldButton) : CGRectGetMaxY(style.kf_PayButton)) + kMargin5);
    
    return style;
}

@end



@implementation DZDSectionStyle

+(instancetype)DSectionStyle:(CGFloat)cellWidth like:(NSInteger)likeCount payOrReward:(NSInteger)payOrReward{
    
    DZDSectionStyle *style = [[DZDSectionStyle alloc] init];
    
    style.frame_PayView = [DZDPayStyle DZQDetailPayStyle:cellWidth payOrReward:payOrReward];
    style.kf_PayView = CGRectMake(kMargin15, kMargin10, cellWidth-kMargin30, style.frame_PayView.kf_PayViewSize.height);
    
    style.frame_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
    style.kf_toolBar = CGRectMake(0, CGRectGetMaxY(style.kf_PayView)+kMargin5, cellWidth, style.frame_toolBar.kf_ToolBarHeight);
    
    style.kf_Line = CGRectMake(0, CGRectGetMaxY(style.kf_toolBar), cellWidth, kMargin10);
    
    CGFloat likeH = likeCount ? (kMargin30 + kMargin10) : 0;
    CGFloat bottomLineH = (likeCount || payOrReward) ? kMargin5 : 0;
     // 这个布局 跟  userListLayout  有密切关系 
    style.kf_listOne = CGRectMake(0, CGRectGetMaxY(style.kf_Line), cellWidth, likeH);
    style.kf_bottomLine = CGRectMake(0, CGRectGetMaxY(style.kf_listOne), cellWidth, bottomLineH);
    
    // 计算总的高度
    style.kf_SectionSize = CGSizeMake(cellWidth, CGRectGetMaxY(style.kf_bottomLine));
    
    return style;
}




@end







