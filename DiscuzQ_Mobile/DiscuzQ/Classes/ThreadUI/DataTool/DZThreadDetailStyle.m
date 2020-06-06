//
//  DZThreadDetailStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDetailStyle.h"

@implementation DZThreadDetailStyle


+(DZThreadDetailStyle *)inner_dataStyle:(DZQDataThread *)dataModel{
    
    // 前端展示 字段 格式化
    [self formartThreadPostContentString:dataModel];
    
    // 计算布局样式
    return [self canculateContentDetailStyle:dataModel];
    
}

// 数据显示 格式化
+ (void)formartThreadPostContentString:(DZQDataThread *)dataModel{
    
    // 在详情页 不再计算评论信息 UI布局
    dataModel.relationships.posts = nil;
    
    // 格式化
    dataModel.attributes.createdAt = [dataModel.attributes.createdAt dateFormatWithAccurate:unAccurate];
    dataModel.attributes.updatedAt = [dataModel.attributes.updatedAt dateFormatWithAccurate:unAccurate];
    
    for (DZQDataPost *dataPost in dataModel.relationships.posts) {
        
        dataPost.attributes.createdAt = [dataPost.attributes.createdAt dateFormatWithAccurate:unAccurate];
        dataPost.attributes.updatedAt = [dataPost.attributes.updatedAt dateFormatWithAccurate:unAccurate];
    }
    
}

// 计算 空间高度 宽度等
+ (instancetype)canculateContentDetailStyle:(DZQDataThread *)dataModel{
    
    DZThreadDetailStyle *threadStyle = [self DThreadDetailStyle:dz_CellWidth maxWidth:dz_CellMaxContentWidth dataModel:dataModel];
    
    
    return threadStyle;
    
}



// 计算评论内容 frame
+(instancetype)DThreadDetailStyle:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataThread *)dataModel{
    
    
    DZThreadDetailStyle *style = [[DZThreadDetailStyle alloc] init];
    
    style.frame_detail_Head =  [[DZDHeadStyle new] DHeadStyle:dataModel cellWidth:cellWidth maxWidth:contenMaxWidth];
    
    style.kf_Header = CGRectMake(0, 0, cellWidth, style.frame_detail_Head.kf_HeadSize.height);
    
    
    style.frame_detail_Section = [DZDSectionStyle DSectionStyle:cellWidth like:dataModel.relationships.firstPost.relationships.likedUsers.count reward:dataModel.relationships.rewardedUsers.count];
    style.kf_Section = CGRectMake(0,0, cellWidth, style.frame_detail_Section.kf_SectionSize.height);
    
    
    // 计算各个回复cell的布局
    for (DZQDataPost *dataPost in dataModel.relationships.posts) {
        
        dataPost.styleModel = [DZDPostCellStyle DPostCellStyle:cellWidth maxWidth:contenMaxWidth dataModel:dataPost];
        
    }
    
    return style;

}

@end
