//
//  oldMssageModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/7/6.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface oldMssageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *authorid;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) BOOL showTime;
@property (nonatomic, copy) NSString *touid;
@property (nonatomic, copy) NSString *plid;
@property (nonatomic, copy) NSString *pmid;
@property (nonatomic, copy) NSString *fromavatar;
@property (nonatomic, copy) NSString *toavatar;

@property (nonatomic, assign) CGFloat textHeight;
@property (nonatomic, strong) YYTextLayout *textLayout; //文本
@property (nonatomic, strong) NSAttributedString *commentAttributeText;

+ (id)messageModelWithDict:(NSDictionary *)dict;

@end
