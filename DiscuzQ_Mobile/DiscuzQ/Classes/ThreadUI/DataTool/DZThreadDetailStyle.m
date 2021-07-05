//
//  DZThreadDetailStyle.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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
    dataModel.relationships.firstPost.attributes.createdAt = [dataModel.relationships.firstPost.attributes.createdAt dateFormatWithAccurate:unAccurate];
    
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
    
    style.frame_detail_Head = [style refreshThreadDetail:cellWidth maxWidth:contenMaxWidth dataModel:dataModel];
    
    NSInteger payOrReward = dataModel.attributes.rewardedCount + dataModel.attributes.paidCount;
    style.frame_detail_Section = [DZDSectionStyle DSectionStyle:cellWidth like:dataModel.relationships.firstPost.relationships.likedUsers.count payOrReward:payOrReward];
    
    style.kf_Section = CGRectMake(0,0, cellWidth, style.frame_detail_Section.kf_SectionSize.height);
    
    
    // 计算各个回复cell的布局
    for (DZQDataPost *dataPost in dataModel.relationships.posts) {
        dataPost.styleModel = [DZDPostCellStyle DPostCellStyle:cellWidth maxWidth:contenMaxWidth dataModel:dataPost];
    }
    
    return style;

}




-(DZDHeadStyle *)refreshThreadDetail:(CGFloat)cellWidth maxWidth:(CGFloat)contenMaxWidth dataModel:(DZQDataThread *)dataModel{
    
    DZDHeadStyle *frame_detail_Head =  [[DZDHeadStyle new] DHeadStyle:dataModel cellWidth:cellWidth maxWidth:contenMaxWidth];
    
    // 如果不含有分类，下面减少分类条间距
    CGFloat cateMargin = dataModel.relationships.category.attributes.name.length ? 0 : frame_detail_Head.frame_toolBar.kf_ToolBarHeight;
    self.kf_Header = CGRectMake(0, 0, cellWidth, frame_detail_Head.kf_HeadSize.height - cateMargin);
    
    return frame_detail_Head;
}


// 下载图片之后，重新计算frame
-(void)reloadThreadDetailWithDataModel:(DZQDataThread *)dataModel{

    self.frame_detail_Head =  [self refreshThreadDetail:dz_CellWidth maxWidth:dz_CellMaxContentWidth dataModel:dataModel];
    
}


@end
