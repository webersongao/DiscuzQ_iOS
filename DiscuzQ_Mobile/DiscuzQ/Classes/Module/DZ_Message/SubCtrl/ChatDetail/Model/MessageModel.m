//
//  MessageModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/7/6.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "MessageModel.h"
#import "NSAttributedString+JsEmotion.h"

@implementation MessageModel

+ (id)messageModelWithDict:(NSDictionary *)dict
{
    MessageModel * message = [[self alloc] init];
    message.text = [dict[@"message"] transformationStr];
    message.authorid = dict[@"msgfromid"];

    message.time = [dict stringForKey:@"vdateline"];
    message.type = [dict stringForKey:@"type"];
    message.plid = [dict stringForKey:@"plid"];
    message.pmid = [dict stringForKey:@"pmid"];
    message.touid = [dict stringForKey:@"touid"];
    message.fromavatar = [dict stringForKey:@"fromavatar"];
    message.toavatar = [dict stringForKey:@"toavatar"];

    return message;
}

- (void)setText:(NSString *)text {
    
    _text = text;
    
    CGFloat textWidth = 250.0;
    UIFont *fontSize = KFont(14);
    
    NSMutableString *string = text.mutableCopy;
    NSMutableAttributedString *textstr = [[NSMutableAttributedString alloc] initWithString:string];
    textstr.yy_font = fontSize;
    textstr.yy_color = K_Color_MainTitle;
    
    [textstr emotionFontsize:16.0f];
    
    WBTextLinePositionModifier *modifier = [WBTextLinePositionModifier new];
    modifier.font = fontSize;
    modifier.lineHeightMultiple = 1.8;
    modifier.paddingTop = 0;
    modifier.paddingBottom = kWBCellPaddingText;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(textWidth, HUGE);
    container.linePositionModifier = modifier;
    
    self.commentAttributeText = textstr;
    _textLayout = [YYTextLayout layoutWithContainer:container text:textstr];
    if (!_textLayout) return;
    CGFloat textHeight = [modifier heightForLineCount:_textLayout.rowCount];
    self.textHeight = textHeight;
}

@end
