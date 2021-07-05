//
//  DZDStyleHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDStyleHelper.h"

@implementation DZDStyleHelper


+(NSString *)mainTitle_ForThreadData:(DZQDataThread *)dataModel{
    NSString *titleStr = dataModel.attributes.title;
    if (dataModel.attributes.type == 5) {
        NSInteger answerState = dataModel.relationships.question.attributes.is_answer;
        if (answerState == 0) {
            // 未回答
            titleStr = [NSString stringWithFormat:@"【未得到回答】"];
        }else if (answerState == 1){
            // 已回答
            titleStr = [NSString stringWithFormat:@"【@ %@】回答了该提问",dataModel.relationships.question.relationships.beUser.attributes.username];
        }else if (answerState == 2){
            // 已过期
            titleStr = [NSString stringWithFormat:@"【提问已过期】"];
        }
    }
    
    return titleStr;
}




@end
