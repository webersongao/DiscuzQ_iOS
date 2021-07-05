//
//  DZQChatMessage.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatMessage.h"
#import "DZQChatEmotionModel.h"

@implementation DZQChatMessage


//判断当前时间是否展示
-(void)showTimeWithLastShowTime:(NSString *)lastTime currentTime:(NSString *)currentTime{
    
    long long lastTimeStamp = [NSTimer getStampWithTime:lastTime];
    long long currentTimeStamp = [NSTimer getStampWithTime:currentTime];
    
    NSTimeInterval timeInterval = [NSTimer CompareTwoTime:lastTimeStamp time2:currentTimeStamp];

    
    if(timeInterval/60 >= 5){
        _showTime = YES;
    }else{
        _showTime = NO;
    }
    
}


//文本消息
-(void)setTextString:(NSString *)textString{
    _textString = textString;
    self.attTextString = [[DZQChatEmotionCenter sharedCenter]emotionImgsWithString:textString];
   
    //设置以字符为单位的换行和行高 间距 字号 颜色
    NSMutableParagraphStyle *paragraphString = [[NSMutableParagraphStyle alloc] init];
    paragraphString.lineBreakMode = NSLineBreakByCharWrapping;
    [paragraphString setLineSpacing:DZQChatTextLineSpacing];

    [_attTextString addAttribute:NSParagraphStyleAttributeName value:paragraphString range:NSMakeRange(0, _attTextString.length)];
    [_attTextString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:DZQChatTextFont] range:NSMakeRange(0, _attTextString.length)];
    [_attTextString addAttribute:NSForegroundColorAttributeName value:DZQChatTextColor range:NSMakeRange(0, _attTextString.length)];
 
}



@end
