//
//  DZBarButtonItem.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBarButtonItem.h"

@implementation DZBarButtonItem

- (instancetype)initTextBarButton:(NSString *)titleOrImage touchH:(NSString *)titleOrImageH target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        self.title = titleOrImage;
        self.title_H = titleOrImageH;
        
        self.action = action;
        self.target = target;
        self.isBackImage = NO;
        self.isTextButton = YES;
    }
    return self;
}


- (instancetype)initImageBarButton:(NSString *)imagePath touchH:(NSString *)imagePathH isBack:(BOOL)isBack target:(id)target action:(SEL)action
{
    self = [super init];
    if (self) {
        self.imagePath = imagePath;
        self.imagePath_H = imagePathH;
        
        self.action = action;
        self.target = target;
        self.isBackImage = isBack;
        self.isTextButton = NO;
    }
    return self;
}


@end
