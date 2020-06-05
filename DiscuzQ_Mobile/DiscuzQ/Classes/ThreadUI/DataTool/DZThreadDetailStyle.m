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
    
    DZThreadDetailStyle *localStyle = [[DZThreadDetailStyle alloc] init];
    
    // 前端展示 字段 格式化
    [self formartThreadPostContentString:dataModel detailStyle:localStyle];
    
    // 计算布局样式
    [self canculateContentDetailStyle:dataModel detailStyle:localStyle];
    
    
    return localStyle;
}

// 数据显示 格式化
+ (void)formartThreadPostContentString:(DZQDataThread *)dataModel detailStyle:(DZThreadDetailStyle *)style{
    
    dataModel.attributes.createdAt = [dataModel.attributes.createdAt dateFormatWithAccurate:unAccurate];;
    dataModel.attributes.updatedAt = [dataModel.attributes.createdAt dateFormatWithAccurate:unAccurate];;
    
    for (DZQDataPost *dataPost in dataModel.relationships.posts) {
        
        dataPost.attributes.createdAt = [dataPost.attributes.createdAt dateFormatWithAccurate:unAccurate];;
        dataPost.attributes.updatedAt = [dataPost.attributes.createdAt dateFormatWithAccurate:unAccurate];;
    }
    
}

// 计算 空间高度 宽度等
+ (void)canculateContentDetailStyle:(DZQDataThread *)dataModel detailStyle:(DZThreadDetailStyle *)style{
    
    CGFloat cellWidth = KScreenWidth;
    CGFloat cellContenMaxWidth = cellWidth - kMargin30;
    
    style.frame_detail_Head =  [[DZDHeadStyle new] DHeadStyle:dataModel cellWidth:cellWidth maxWidth:cellContenMaxWidth];
    
    style.kf_Header = CGRectMake(0, 0, cellWidth, style.frame_detail_Head.kf_HeadSize.height);
    
    
    style.frame_detail_Section = [DZDSectionStyle DSectionStyle:cellWidth like:dataModel.relationships.firstPost.relationships.likedUsers.count reward:dataModel.relationships.rewardedUsers.count];
    style.kf_Section = CGRectMake(0,0, cellWidth, style.frame_detail_Section.kf_SectionSize.height);
    
    
    // 计算各个回复cell的布局
    for (DZQDataPost *dataPost in dataModel.relationships.posts) {

        dataPost.styleModel = [DZDPostCellStyle DPostCellStyle:cellWidth maxWidth:cellContenMaxWidth dataModel:dataPost];
        
    }
    
}





@end
