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
    return [self canculateContentListStyle:dataModel];
    
}


// 数据显示 格式化
+ (void)formartThreadContentString:(DZQDataThread *)dataModel{
    
    
    dataModel.relationships.firstPost.attributes.createdAt = [dataModel.relationships.firstPost.attributes.createdAt dateFormatWithAccurate:unAccurate];
    dataModel.relationships.firstPost.attributes.updatedAt = [dataModel.relationships.firstPost.attributes.updatedAt dateFormatWithAccurate:unAccurate];
    
}

// 计算 空间高度 宽度等
+ (DZThreadListStyle *)canculateContentListStyle:(DZQDataThread *)dataModel{
    
    DZThreadListStyle *threadStyle = [[DZThreadListStyle alloc] init];
    CGFloat cellWidth = dz_CellWidth;
    CGFloat cellContenMaxWidth = dz_CellMaxContentWidth;
    
    if (dataModel.attributes.isSticky) {
        
        threadStyle.kf_HeadSize = CGSizeMake(dz_CellWidth, kToolBarHeight);
        threadStyle.kf_thread_CellHeight = threadStyle.kf_HeadSize.height;
        
        // 文章类型(0 普通 1 长文 2 视频 3 图片)
        NSString *summaryString = (dataModel.attributes.type == 1) ? dataModel.attributes.title : dataModel.relationships.firstPost.attributes.summary;
        threadStyle.summaryAttributeStr = [NSString attributeWithLineSpaceing:5 text:summaryString font:KFont(12.f)];
        
    }else{
        
        // 第一部分 用户基本信息
        threadStyle.frame_user = [DZDUserStyle DUserStyle:cellWidth basic:NO];
        threadStyle.kf_head = CGRectMake(0, 0, cellWidth, threadStyle.frame_user.kf_UserHeight);
        
        
        // 第一部分 主题内容高度
        threadStyle.frame_content = [DZDContentStyle  DThreadContentStyleWithMaxW:cellContenMaxWidth cellWidth:cellWidth dataModel:dataModel isDetail:NO];
        threadStyle.kf_content = CGRectMake(0, CGRectGetMaxY(threadStyle.kf_head), cellWidth, threadStyle.frame_content.kf_ContentHeight);
        
        
        // 第三部分 转评赞 工具条
        threadStyle.frame_toolBar = [DZDToolBarStyle DToolBarStyle:cellWidth];
        threadStyle.kf_toolBar = CGRectMake(0, CGRectGetMaxY(threadStyle.kf_content), cellWidth, threadStyle.frame_toolBar.kf_ToolBarHeight);
        
        CGFloat headeHeight = threadStyle.kf_head.size.height + threadStyle.kf_content.size.height + threadStyle.kf_toolBar.size.height;
        
        threadStyle.kf_HeadSize = CGSizeMake(cellWidth, headeHeight);
        
        
        
        // 计算总的高度
        threadStyle.kf_thread_CellHeight = threadStyle.kf_HeadSize.height;
        
    }
    
    
    return threadStyle;
    
}








@end
