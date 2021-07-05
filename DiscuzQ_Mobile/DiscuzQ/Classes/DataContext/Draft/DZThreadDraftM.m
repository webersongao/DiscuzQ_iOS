//
//  DZThreadDraftM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadDraftM.h"
#import "DataBaseHeader.h"

@implementation DZThreadDraftM

// type: 文章类型(0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖)
- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = 0;
        _is_draft = NO;
        _content = @"";
        _category = [DZThreadDraftMCate defaultCategory];
    }
    return self;
}

// 转换成 主题发送参数字典
-(NSDictionary *)parameterToSendThreadWithCaptcha:(NSDictionary *)captcha{
    
    NSMutableDictionary *dataParameter = [NSMutableDictionary dictionary];
    
    NSDictionary *attributeDict = [self attributesToSendWithCpatcha:captcha];
    NSDictionary *relationshipsDict = [self relationshipsToSendThread];
    
    /// 最后 合并参数字典
    [dataParameter setValue:@"threads" forKey:@"type"];
    [dataParameter setValue:attributeDict forKey:@"attributes"];
    [dataParameter setValue:relationshipsDict forKey:@"relationships"];
    
    return [NSDictionary dictionaryWithObject:dataParameter forKey:@"data"];
}


// attributes 转换成 主题发送参数字典
-(NSDictionary *)attributesToSendWithCpatcha:(NSDictionary *)capDict{
    
    // 纠错
    if (_title.length && _type == 0) {
        NSLog(@"WBS 类型选择错误");
    }
    
    NSMutableDictionary *attDict = [NSMutableDictionary dictionary];
    
    if (capDict && capDict.allKeys.count) {
        [attDict addEntriesFromDictionary:capDict];
    }
    [attDict setValue:checkNull(self.title) forKey:@"title"];
    [attDict setValue:checkNull(self.content) forKey:@"content"];
    [attDict setValue:@(self.price) forKey:@"price"];
    [attDict setValue:@(self.attachment_price) forKey:@"attachment_price"];
    [attDict setValue:@(self.free_words) forKey:@"free_words"];
    [attDict setValue:@(self.type) forKey:@"type"];
    [attDict setValue:self.longitude.numberValue forKey:@"longitude"];
    [attDict setValue:self.latitude.numberValue forKey:@"latitude"];
    [attDict setValue:checkNull(self.address) forKey:@"address"];
    [attDict setValue:checkNull(self.location) forKey:@"location"];
    
    [attDict setValue:checkNull(self.file_id) forKey:@"file_id"];
    [attDict setValue:checkNull(self.file_name) forKey:@"file_name"];
    [attDict setValue:checkNull(self.cover_url) forKey:@"cover_url"];
    [attDict setValue:checkNull(self.media_url) forKey:@"media_url"];
    
    [attDict setValue:@(self.post_goods_id) forKey:@"post_goods_id"];
    [attDict setValue:[NSNumber numberWithBool:self.is_draft] forKey:@"is_draft"];
    [attDict setValue:[NSNumber numberWithBool:self.is_anonymous] forKey:@"is_anonymous"];
    
    return attDict.copy;
}

// relationships 转换成 主题发送参数字典
-(NSDictionary *)relationshipsToSendThread{
    
    NSDictionary *categoryDict = self.category ? [self.category cateModelToDictionary] : @{@"data":@{}};
    NSDictionary *questionDict = self.question ? [self.question quesModelToDictionary] : @{@"data":@{}};
    
    NSMutableArray *attachDictArr = [NSMutableArray array];
    for (DZThreadDraftMAttach *attachModel in self.attachments) {
        [attachDictArr addObject:[attachModel attachModelToDictionary]];
    }
    NSMutableDictionary *attachmentDict = [NSMutableDictionary dictionaryWithObject:attachDictArr forKey:@"data"];
    
    NSDictionary *relationDict = [NSMutableDictionary dictionary];
    [relationDict setValue:categoryDict forKey:@"category"];
    [relationDict setValue:questionDict forKey:@"question"];
    [relationDict setValue:attachmentDict forKey:@"attachments"];
    
    return relationDict;
}

-(void)setCategory:(DZThreadDraftMCate *)category{
    _category = category;
    _categoryjsonString = [category DZQ_ModelToJSONString];
}

-(void)setQuestion:(DZThreadDraftMQues *)question{
    _question = question;
    _questionjsonString = [question DZQ_ModelToJSONString];
}

-(void)setAttachments:(NSArray<DZThreadDraftMAttach *> *)attachments{
    _attachments = attachments;
    _attachmentsjsonString = [attachments DZQ_ModelToJSONString];
}




@end
