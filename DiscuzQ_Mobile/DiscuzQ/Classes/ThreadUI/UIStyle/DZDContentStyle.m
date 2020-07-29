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
    
    CGFloat mediaHeight = [self canculateMediaDetailHeight:dataModel cellWidth:cellWidth maxW:maxWidth isDetail:isDetail];
    CGFloat attachHeight = isDetail ? [self attachFileListHeight:dataModel.relationships.firstPost.relationships.attachments.count] : 0;
    
    DZDContentStyle *contentStyle = [self inner_contentTitle:dataModel.attributes.title titleFont:KBoldFont(KContent_fontSize) contentHtml:contentHtml mediaH:mediaHeight attachH:attachHeight contentMaxW:maxWidth];
    
    // 九宫格布局参数
    contentStyle.kf_squareGrid = [DZDGridStyle DGridImageStyle:dataModel.relationships.firstPost.relationships.images cellWidth:cellWidth];
    
    return contentStyle;
}

// 计算评论内容 frame
+(instancetype)DPostContentStyleWithMaxW:(CGFloat)maxWidth cellWidth:(CGFloat)cellWidth dataModel:(DZQDataPost *)dataModel{
    
    NSString *contentHtml = dataModel.attributes.contentHtml;
    CGFloat mediaHeight = [self canculatePicAttachContentHeight:dataModel cellWidth:cellWidth];
    CGFloat attachHeight = [self attachFileListHeight:dataModel.relationships.attachments.count];
    
    DZDContentStyle *contentStyle = [self inner_contentTitle:nil titleFont:KFont(14.f) contentHtml:contentHtml mediaH:mediaHeight attachH:attachHeight contentMaxW:maxWidth];
    
    contentStyle.kf_squareGrid = [DZDGridStyle DGridImageStyle:dataModel.relationships.images cellWidth:cellWidth];
    
    return contentStyle;
}

+(instancetype)inner_contentTitle:(NSString *)mainTitle titleFont:(UIFont *)font contentHtml:(NSString *)contentHtml mediaH:(CGFloat)mediaH attachH:(CGFloat)attachH contentMaxW:(CGFloat)contenMaxWidth{
    
    DZDContentStyle *contStyle = [[DZDContentStyle alloc] init];
    
   CGFloat titleH = [self titleStringHeight:mainTitle maxWidth:contenMaxWidth];
    
    CGFloat oneMarginY = titleH ? kMargin10 : 0;
    contStyle.kf_titleFont = font ? font : [UIFont systemFontOfSize:14.f];
    contStyle.kf_titleFrame = CGRectMake(kMargin15, oneMarginY, contenMaxWidth, titleH);
    
    CGFloat twoMarginY = titleH ? kMargin15 : kMargin10;
    // CGFLOAT_HEIGHT_UNKNOWN 不可替换
    contStyle.kf_contentMaxRect = CGRectMake(kMargin15, CGRectGetMaxY(contStyle.kf_titleFrame)+twoMarginY, contenMaxWidth, CGFLOAT_HEIGHT_UNKNOWN);
    contStyle.kf_contentItem = [DZHtmlItem canculateHtmlStyle:contentHtml maxRect:contStyle.kf_contentMaxRect];
    contStyle.kf_contentFrame = contStyle.kf_contentItem.frame;
    
    CGFloat mediaMarginY = mediaH ? (contStyle.kf_contentFrame.size.height ? kMargin10 : 0) : 0;
    contStyle.kf_mediaFrame = CGRectMake(kMargin15, CGRectGetMaxY(contStyle.kf_contentFrame)+mediaMarginY, contenMaxWidth, mediaH);
    
    CGFloat attachMarginY = attachH ? (contStyle.kf_mediaFrame.size.height ? kMargin20 : kMargin10) : 0;
    contStyle.kf_attachFrame = CGRectMake(kMargin15, CGRectGetMaxY(contStyle.kf_mediaFrame)+attachMarginY, contenMaxWidth, attachH);
    
    contStyle.kf_ContentHeight = CGRectGetMaxY(contStyle.kf_attachFrame) + kMargin15;
    
    return contStyle;
}

// 返回的 只有第一部分的高度
+ (CGFloat)canculateMediaDetailHeight:(DZQDataThread *)dataModel cellWidth:(CGFloat)cellWidth maxW:(CGFloat)maxWidth isDetail:(BOOL)isDetail{
    
    // 文章类型(0 普通 1 长文 2 视频 3 图片)
    CGFloat oneHeight = 0;
    NSInteger modelType = dataModel.attributes.type;
    
    if (modelType == 1){
        // 长文章 的配图
        NSInteger imageCount = dataModel.relationships.firstPost.relationships.images.count;
        
        oneHeight = [self imageSquareHeight:imageCount cellWidth:cellWidth];
        
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
+ (CGFloat)canculatePicAttachContentHeight:(DZQDataPost *)dataModel cellWidth:(CGFloat)cellWidth{
    
    // 回复内容（目前只支持 图片回复）
    
    NSInteger imageCount = dataModel.relationships.images.count;
    
    return [self imageSquareHeight:imageCount cellWidth:cellWidth];
}


// 计算 标题文字 的高度
+(CGFloat)titleStringHeight:(NSString *)titleStr maxWidth:(CGFloat)maxWidth{
    CGFloat lineSpace = 5.0;
    return [NSString cacaulteStringHeight:titleStr fontSize:KTitle_fontSize width:maxWidth lineSpacing:lineSpace];
}

// 计算 标题文字 的高度
+(CGFloat)attachFileListHeight:(NSInteger)fileCount{
    
    return (kMargin20 * fileCount) + (fileCount ? KCenterBarHeight : 0 );
}


// 计算图片九宫格的高度
+(CGFloat)imageSquareHeight:(NSInteger)imageCount cellWidth:(CGFloat)cellWidth{
    
    CGFloat sqareHeight = 0;
    
    CGSize itemSize = [DZDGridItemStyle DGridItemHeightWithCount:imageCount superWidth:(cellWidth - kMargin30)];
    
    NSInteger lineNum = ((int)(ceilf(imageCount/3.f)));
    
    CGFloat imageHeight = ((lineNum * itemSize.height) + ((lineNum - 1) * kMargin5));
    
    sqareHeight = imageCount ? imageHeight : 0;
    
    return sqareHeight;
}

@end
