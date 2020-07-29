//
//  DZThreadListModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/18.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZThreadListModel+Display.h"
#import "DZAttachModel.h"

@implementation DZThreadListModel

+ (NSDictionary*)modelCustomPropertyMapper {
    return @{
        @"typeId" : @"typeid",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attachlist" : [DZAttachModel class],
             @"reply" : [DZThreadReplyModel class]
    };
}

#pragma mark - 重写settter方法 过滤标签

-(void)setViews:(NSString *)views{
    _views = [views onePointCountWithNumstring];
}

-(void)setReplies:(NSString *)replies{
    _replies = [replies onePointCountWithNumstring];
}

-(void)setMessage:(NSString *)message{
    _message = [message transformationStr];
}

-(void)setRecommend_add:(NSString *)recommend_add{
    _recommend_add = [recommend_add onePointCountWithNumstring];
}

-(void)setDateline:(NSString *)dateline{
    NSCharacterSet *notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([_dateline rangeOfCharacterFromSet:notDigits].location == NSNotFound) { // 是数字
        _dateline = [NSDate timeStringFromTimestamp:dateline format:@"yyyy-MM-dd"];
    }else{
        _dateline = [dateline transformationStr];
    }
}

-(void)setSubject:(NSString *)subject{
    _subject = [subject transformationStr];
    _mainTitleString = _subject;
    _mainTitle = [self AttributedSubject:subject secial:self.special];
}

-(void)setAttachlist:(NSMutableArray<DZAttachModel *> *)attachlist{
    _attachlist = attachlist;
    self.imglist = [NSMutableArray array];
    for (DZAttachModel *attch in attachlist) {
        if ([attch.type isEqualToString:@"image"]) {
            [self.imglist addObject:attch.thumb];
        }
    }
}

-(void)setReply:(NSArray<DZThreadReplyModel *> *)reply{
    _reply = reply;
    DZThreadReplyModel *last = reply.lastObject;
    _lastReplyString = last.message;
    _lastReply = [self AttributedReply:_lastReplyString];
}

-(void)setDigest:(NSString *)digest{
    _digest = digest;
    
    if ([digest isEqualToString:@"1"] || [digest isEqualToString:@"2"] || [digest isEqualToString:@"3"]) {
        self.tagImage = [UIImage imageNamed:@"精华"];
    } else if ([digest isEqualToString:@"0"]) {
        self.tagImage = nil;
    }else{
        self.tagImage = [UIImage imageNamed:@"热门"];
    }
}



-(void)setGrouptitle:(NSString *)grouptitle {
    if ([DataCheck isValidString:grouptitle]) {
        _grouptitle = [grouptitle flattenHTMLTrimWhiteSpace:YES];
    }else{
        _grouptitle = @"";
    }
}

-(void)setTypeName:(NSString *)typeName {
    if ([DataCheck isValidString:typeName]) {
        _typeName = [typeName flattenHTMLTrimWhiteSpace:YES];
    }else{
        _typeName = @"";
    }
}


#pragma mark   /********************* 数据格式化 *************************/

-(NSAttributedString *)AttributedReply:(NSString *)String{
    return [NSString attributeWithLineSpaceing:5 text:String font:KFont(14.f)];
}

-(NSAttributedString *)AttributedSubject:(NSString *)String secial:(NSString *)special{
    
    return [NSString attributedWithLeftimage:@"dz_close" RightTittle:String textColor:KColor(K2A2C2F_Color, 1.0) FontSize:16];
}

-(void)updateThreadModelLayout{
    BOOL isCellTop = [self isTopThread];
    self.listLayout = [[DZThreadLayout alloc] initWithModel:self isList:YES isTop:isCellTop];
    self.squareLayout = [[DZThreadLayout alloc] initWithModel:self isList:NO isTop:isCellTop];
}

@end








