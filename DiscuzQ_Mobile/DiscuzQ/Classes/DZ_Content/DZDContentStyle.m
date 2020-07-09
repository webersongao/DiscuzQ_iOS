//
//  DZDContentStyle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDContentStyle.h"



@implementation DZDContentStyle

// 计算主题（帖子）内容 frame
+(instancetype)DThreadContentStyleWithMaxW:(CGFloat)maxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataThread *)dataModel isDetail:(BOOL)isDetail{
    
    NSString *contentHtml = isDetail ? dataModel.relationships.firstPost.attributes.contentHtml : dataModel.relationships.firstPost.attributes.summary;

    CGFloat localOneH = [self canculateContentDetailHeight:dataModel cellWidth:cellWidth maxW:maxWidth font:k_One_fontSize isDetail:isDetail];
    
    DZDContentStyle *contentStyle = [self inner_contentStyle:contentHtml localOneH:localOneH contentMaxW:maxWidth font:KBoldFont(k_One_fontSize)];
    
    contentStyle.kf_squareGrid = [DZDGridStyle DGridImageStyle:dataModel.relationships.firstPost.relationships.images cellWidth:cellWidth];
    
    return contentStyle;
}

// 计算评论内容 frame
+(instancetype)DPostContentStyleWithMaxW:(CGFloat)maxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataPost *)dataModel{
    
    NSString *contentHtml = dataModel.attributes.contentHtml;
    CGFloat localOneH = [self canculatePostContentHeight:dataModel cellWidth:cellWidth];
    
    DZDContentStyle *contentStyle = [self inner_contentStyle:contentHtml localOneH:localOneH contentMaxW:maxWidth font:KFont(14.f)];
    
    contentStyle.kf_squareGrid = [DZDGridStyle DGridImageStyle:dataModel.relationships.images cellWidth:cellWidth];
    
    return contentStyle;
}

+(instancetype)inner_contentStyle:(NSString *)contentHtml localOneH:(CGFloat)localOneH contentMaxW:(CGFloat)contenMaxWidth font:(UIFont *)font{
    
    DZDContentStyle *contStyle = [[DZDContentStyle alloc] init];
    
    CGFloat oneMarginY = localOneH ? kMargin10 : 0;
    CGFloat twoMarginY = localOneH ? kMargin15 : kMargin10;
    
    contStyle.kf_oneFrame = CGRectMake(kMargin15, oneMarginY, contenMaxWidth, localOneH);
    // CGFLOAT_HEIGHT_UNKNOWN 不可替换
    contStyle.kf_twoMaxRect = CGRectMake(kMargin15, CGRectGetMaxY(contStyle.kf_oneFrame)+twoMarginY, contenMaxWidth, CGFLOAT_HEIGHT_UNKNOWN);
    contStyle.kf_twoItem = [DZHtmlItem canculateHtmlStyle:contentHtml maxRect:contStyle.kf_twoMaxRect];
    contStyle.kf_twoFrame = contStyle.kf_twoItem.frame;
    contStyle.kf_oneFont = font ? font : [UIFont systemFontOfSize:14.f];
    
    CGFloat contentMargin = (contStyle.kf_oneFrame.size.height && contStyle.kf_twoFrame.size.height) ? kMargin35 : kMargin20;
    
    contStyle.kf_ContentHeight = (contStyle.kf_oneFrame.size.height + contStyle.kf_twoItem.frame.size.height) + contentMargin;
    
    return contStyle;
}

// 返回的 只有第一部分的高度
+ (CGFloat)canculateContentDetailHeight:(DZQDataThread *)dataModel cellWidth:(CGFloat)cellWidth maxW:(CGFloat)maxWidth font:(CGFloat)titleSize isDetail:(BOOL)isDetail{
    
    // 文章类型(0 普通 1 长文 2 视频 3 图片)
    CGFloat oneHeight = 0;
    NSInteger modelType = dataModel.attributes.type;
    
    if (modelType == 1){
        // 长文章 的标题
        oneHeight = [NSString cacaulteStringHeight:dataModel.attributes.title fontSize:titleSize width:maxWidth lineSpacing:5];
    }else if (modelType == 2){
        // 视频预览图
        CGFloat videoWHRatio = isDetail ? (dataModel.relationships.threadVideo.attributes.width / dataModel.relationships.threadVideo.attributes.height) : KVideoWHRatio;
        CGFloat videoHeight = maxWidth / ((videoWHRatio > 0) ? videoWHRatio : KVideoWHRatio);
        oneHeight = dataModel.relationships.threadVideo.attributes.media_url.length ? videoHeight : 0;
    }else if (modelType == 3 || modelType == 0) {
        // 第一部分 只能是 图片
        NSInteger imageCount = dataModel.relationships.firstPost.relationships.images.count;
        
        oneHeight = [self imageSquareHeight:imageCount cellWidth:cellWidth];
    }
    
    // 只返回第一个 高度
    return oneHeight;
}

// 返回的 只有第一部分的高度
+ (CGFloat)canculatePostContentHeight:(DZQDataPost *)dataModel cellWidth:(CGFloat)cellWidth{
    
    // 回复内容（目前只支持 图片回复）
    
    NSInteger imageCount = dataModel.relationships.images.count;
    
    return [self imageSquareHeight:imageCount cellWidth:cellWidth];
}


+(CGFloat)imageSquareHeight:(NSInteger)imageCount cellWidth:(CGFloat)cellWidth{
    
    CGFloat sqareHeight = 0;
    
    CGSize itemSize = [DZDGridItemStyle DGridItemHeightWithCount:imageCount superWidth:(cellWidth - kMargin30)];
    
    NSInteger lineNum = ((int)(ceilf(imageCount/3.f)));
    
    CGFloat imageHeight = ((lineNum * itemSize.height) + ((lineNum - 1) * kMargin5));
    
    sqareHeight = imageCount ? imageHeight : 0;
    
    return sqareHeight;
}

@end
