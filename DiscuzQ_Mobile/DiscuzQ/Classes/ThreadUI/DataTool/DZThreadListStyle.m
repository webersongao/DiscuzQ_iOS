//
//  DZThreadListStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadListStyle.h"

@implementation DZThreadListStyle

+(DZThreadListStyle *)inner_dataStyle:(DZQDataThread *)dataModel{
    
    // 前端展示 字段 格式化
    [self formartThreadContentString:dataModel];
    
    // 计算布局样式
    DZThreadListStyle *localStyle = [self canculateContentListStyle:dataModel];
    
    
    return localStyle;
}


// 数据显示 格式化
+ (void)formartThreadContentString:(DZQDataThread *)dataModel{
    
    
    dataModel.relationships.firstPost.attributes.createdAt = [dataModel.relationships.firstPost.attributes.createdAt dateFormatWithAccurate:unAccurate];
    dataModel.relationships.firstPost.attributes.updatedAt = [dataModel.relationships.firstPost.attributes.updatedAt dateFormatWithAccurate:unAccurate];
    
}

// 计算 空间高度 宽度等
+ (DZThreadListStyle *)canculateContentListStyle:(DZQDataThread *)dataModel{
    
    CGFloat cellWidth = KScreenWidth;
    CGFloat cellContenMaxWidth = KScreenWidth - kMargin30;
    
    DZThreadListStyle *threadStyle = [[DZThreadListStyle new] DHeadStyle:dataModel cellWidth:cellWidth maxWidth:cellContenMaxWidth];
    
    // 第一部分 用户基本信息
//    style.frame_user = [DZDUserStyle DUserStyle:cellWidth basic:NO];
//    style.kf_head = CGRectMake(0, 0, cellWidth, style.frame_user.kf_UserHeight);
//
//
//    // 第一部分 主题内容高度
//    style.frame_content = [DZDContentStyle DThreadContentStyleWithMaxW:cellContenMaxWidth dataModel:dataModel];
//    style.kf_content = CGRectMake(0, CGRectGetMaxY(style.kf_head), cellWidth, style.frame_content.kf_ContentHeight);
//
//
//    // 第三部分 转评赞 工具条
//    style.frame_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
//    style.kf_toolBar = CGRectMake(0, CGRectGetMaxY(style.kf_content), cellWidth, style.frame_toolBar.kf_ToolBarHeight);
//
//
//    CGFloat headeHeight = style.kf_head.size.height + style.kf_content.size.height + style.kf_toolBar.size.height;
//
//    style.kf_HeadSize = CGSizeMake(cellWidth, headeHeight);

    
    // 计算总的高度
    threadStyle.kf_thread_CellHeight = threadStyle.kf_HeadSize.height;
    
    
    return threadStyle;
    
}








@end
