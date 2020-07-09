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
    
//    origin_html = [origin_html stringByReplacingOccurrencesOfString:@"discuz.chat/static/images" withString:@"discuz.chat/GaoiOS/images"];
    
    item.screen_html = [self regularEmojiExpression:origin_html];
    
//    item.screen_html = [self regularImageAttributedExpression:item.screen_html];
    
    CGSize textSize = [DZHtmlUtils getAttributedTextHeightHtml:item.screen_html withMaxRect:maxRect];
    
    item.frame = CGRectMake(maxRect.origin.x, maxRect.origin.y, maxRect.size.width, textSize.height);
    
    item.attributedString = [DZHtmlUtils getAttributedStringWithHtml:item.screen_html];
    
    return item;
}

// 对emoji图片额外处理
+(NSString *)regularEmojiExpression:(NSString *)htmlString{
    
//    NSError* error = nil;
    htmlString = checkNull(htmlString);
//    CGFloat scaleWH = k_Two_detailSize;
//
//    NSString *styleCssString = [NSString stringWithFormat:@"$1<img src=\"$2/emoji/$3\" style=\"width:%.fpx; height:%.fpx;\" alt=\"$4",scaleWH,scaleWH];
//
//    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:@"(.*?)<img src=\\\"(.*?)/emoji/(.*?)\\\" alt=\\\"(.*?)" options:NSRegularExpressionCaseInsensitive error:&error];
//
//    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];
    
    
    
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"display:inline-block;height:20px;vertical-align:top" withString:@"display:inline-block;height:20px;width:20px;vertical-align:middle"];
    
    NSString *expstr = [htmlString stringByReplacingOccurrencesOfString:@"display:inline-block;vertical-align:top" withString:@"display:inline-block;height:20px;width:20px;vertical-align:middle"];
    
    
 //   <img style=\"display:inline-block;height:20px;vertical-align:top\" src=\"https://discuz.chat/emoji/qq/bangbangtang.gif\" alt=\"bangbangtang\" class=\"qq-emotion\">
    
    return expstr;
}

// 对 富文本 图片额外处理 (目前只支持 站内图片)
+(NSString *)regularImageAttributedExpression:(NSString *)htmlString{
    
    NSError* error = nil;
    htmlString = checkNull(htmlString);
    CGFloat scaleWH = 100;
    NSString *lcoalHost = [NSURL URLWithString:DZQ_BASEURL].host ?: @"iOSSDK_DomainError.com";
    NSString *styleCssString = [NSString stringWithFormat:@"$1<img src=\"$2/%@/$3\" style=\"width:%.fpx; height:%.fpx;\" alt=\"$4",lcoalHost,scaleWH,scaleWH];
        
    NSString *regexString = [NSString stringWithFormat:@"(.*?)<img src=\\\"(.*?)/%@/(.*?)\\\" alt=\\\"(.*?)",lcoalHost];
    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];
    
    return expstr;
}



@end
