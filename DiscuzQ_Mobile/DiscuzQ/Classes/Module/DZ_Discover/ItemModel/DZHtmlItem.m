//
//  DZHtmlItem.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHtmlItem.h"


@implementation DZHtmlItem

+(instancetype)canculateHtmlStyle:(NSString *)origin_html maxRect:(CGRect)maxRect{
    
    DZHtmlItem *item = [[DZHtmlItem alloc] init];
    maxRect = CGRectMake(maxRect.origin.x, maxRect.origin.y, maxRect.size.width, CGFLOAT_HEIGHT_UNKNOWN);
    // content 计算显示富文本
    item.maxRect = maxRect;
    item.screen_html = [self regularEmojiExpression:origin_html];
    
    CGSize textSize = [DZHtmlUtils getAttributedTextHeightHtml:item.screen_html withMaxRect:maxRect];
    
    item.frame = CGRectMake(maxRect.origin.x, maxRect.origin.y, maxRect.size.width, textSize.height);
    
    item.attributedString = [DZHtmlUtils getAttributedStringWithHtml:item.screen_html];
    
    return item;
}


+(NSString *)regularEmojiExpression:(NSString *)htmlString{
    
    NSError* error = nil;
    htmlString = checkNull(htmlString);
    CGFloat scaleWH = k_Two_detailSize;
    
    NSString *styleCssString = [NSString stringWithFormat:@"$1<img src=\"$2/emoji/$3\" style=\"width:%.fpx; height:%.fpx;\" alt=\"$4",scaleWH,scaleWH];
        
    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:@"(.*?)<img src=\\\"(.*?)/emoji/(.*?)\\\" alt=\\\"(.*?)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];
    
    return expstr;
}



@end
