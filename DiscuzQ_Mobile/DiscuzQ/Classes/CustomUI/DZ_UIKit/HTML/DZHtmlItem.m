//
//  DZHtmlItem.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
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
    
    // Emoji
    item.screen_html = [self regular_EmojiExpression:origin_html];
    // 艾特 @
    item.screen_html = [self regular_ATAttributedExpression:item.screen_html];
    // # 话题
    item.screen_html = [self regular_TopicAttributedExpression:item.screen_html];
    
//    item.screen_html = [self regular_innerImageAttributedExpression:item.screen_html];
    
    CGSize textSize = [DZHtmlUtils getAttributedTextHeightHtml:item.screen_html withMaxRect:maxRect];
    
    item.lineHeight = [DZHtmlUtils singleHtmlLineHeight];
    item.frame = CGRectMake(maxRect.origin.x, maxRect.origin.y, maxRect.size.width, textSize.height);
    
    item.attributedString = [DZHtmlUtils getAttributedStringWithHtml:item.screen_html];
    
    return item;
}

// 对emoji图片额外处理
// <img style="display:inline-block;vertical-align:top" src="https://discuz.chat/emoji/qq/fanu.gif" alt="fanu" class="qq-emotion">
+(NSString *)regular_EmojiExpression:(NSString *)htmlString{
    
    NSError* error = nil;
    int emojiWH = 20;  // emoji表情图宽高
    htmlString = checkNull(htmlString);

    NSString *styleCssString = [NSString stringWithFormat:@"$1<img style=\"display:inline-block;height:%dpx;width:%dpx;vertical-align:middle\" src=\"$3/emoji/qq/$4\" alt=\"$5\" class=\"qq-emotion\">",emojiWH,emojiWH];

    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:@"(.*?)<img(.*?)src=\\\"(.*?)/emoji/qq/(.*?)\\\" alt=\\\"(.*?)\" class=\"qq-emotion\">" options:NSRegularExpressionCaseInsensitive error:&error];

    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];
    
    return expstr;
}

//  对 富文本 @艾特 按钮
//    <span id="member" value="5326">@WebersonGao</span>
//    <a href="httpAt://Gao_Local?userid=5326">@WebersonGao</a>
+(NSString *)regular_ATAttributedExpression:(NSString *)htmlString{

    NSError* error = nil;
    htmlString = checkNull(htmlString);
    NSString *styleCssString = [NSString stringWithFormat:@"<a href=\"%@$1?%@=$3\">$5</a>\\",dz_HtmlUrl_key,dz_ParaId_key];
    NSString *regexString = [NSString stringWithFormat:@"<span id=\"(.*?)\"(.*?)value=\"(.*?)\"(.*?)>(.*?)</span>"];
    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];

    return expstr;
}

//  对 富文本 ## 话题按钮
//    <span id="topic" value="4">#discuzQ新版上线#</span>
//    <a href="httpPlus://Gao_Local?topicid=4">#discuzQ新版上线#</a>
+(NSString *)regular_TopicAttributedExpression:(NSString *)htmlString{

    NSError* error = nil;
    htmlString = checkNull(htmlString);
    NSString *styleCssString = [NSString stringWithFormat:@"<a href=\"%@$1?%@=$3\">$5</a>\\",dz_HtmlUrl_key,dz_ParaId_key];
    NSString *regexString = [NSString stringWithFormat:@"<span id=\"(.*?)\"(.*?)value=\"(.*?)\"(.*?)>(.*?)</span>"];
    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:&error];
    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];

    return expstr;
}

// 对 富文本 图片额外处理 (目前只支持 站内图片)
+(NSString *)regular_innerImageAttributedExpression:(NSString *)htmlString{
    
    NSError* error = nil;
    htmlString = checkNull(htmlString);
    CGFloat scaleWH = 100;
    NSString *lcoalHost = [NSURL URLWithString:[DZMobileCtrl siteRootDomain]].host ?: @"iOSSDK_DomainError.com";
    NSString *styleCssString = [NSString stringWithFormat:@"$1<img src=\"$2/%@/$3\" style=\"width:%.fpx; height:%.fpx;\" alt=\"$4",lcoalHost,scaleWH,scaleWH];
        
    NSString *regexString = [NSString stringWithFormat:@"(.*?)<img src=\\\"(.*?)/%@/(.*?)\\\" alt=\\\"(.*?)",lcoalHost];
    NSRegularExpression* exp = [[NSRegularExpression alloc] initWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSString* expstr = [exp stringByReplacingMatchesInString:htmlString options:0 range:NSMakeRange(0, htmlString.length) withTemplate:styleCssString];
    
    return expstr;
}



@end
