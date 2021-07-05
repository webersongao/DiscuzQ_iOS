//
//  DZHtmlUtils.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHtmlUtils.h"

//    DTDefaultFontSize // 字号
//    DTDefaultTextColor // 字体颜色
//    DTDefaultLinkColor // 链接 颜色
//    DTDefaultHeadIndent // 首行缩进
//    DTDefaultTextAlignment  // 行align
//    DTDefaultLinkHighlightColor // 链接 高亮色
//    DTDefaultLineHeightMultiplier  // 行间距
static CGFloat KHtmlLineSpacing = 1.5;

@implementation DZHtmlUtils

//使用HtmlString,和最大左右间距，计算视图的高度
+ (CGSize)getAttributedTextHeightHtml:(NSString *)htmlString withMaxRect:(CGRect)VMaxRect{
    //获取富文本
    NSAttributedString *attributedString =  [self getAttributedStringWithHtml:htmlString];
    //获取布局器
    DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:attributedString];
    NSRange entireString = NSMakeRange(0, [attributedString length]);
    //获取Frame
    DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:VMaxRect range:entireString];
    //得到大小
    CGSize sizeNeeded = [layoutFrame frame].size;
    return sizeNeeded;
}

+(CGFloat)singleHtmlLineHeight{
    return (KContent_fontSize + (KHtmlLineSpacing *2.0) + kMargin5);
}

//Html->富文本NSAttributedString
+ (NSAttributedString *)getAttributedStringWithHtml:(NSString *)htmlString{
    //获取富文本
    NSDictionary *fontDict = @{DTDefaultTextColor:KContent_Color,DTDefaultLinkColor:KGreen_Color,DTDefaultFontSize:[NSNumber numberWithFloat:KContent_fontSize],DTDefaultLineHeightMultiplier:[NSNumber numberWithFloat:KHtmlLineSpacing]};
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithHTMLData:data options:fontDict documentAttributes:NULL];
    return attributedString;
}


@end
