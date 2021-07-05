//
//  DZMediaBrower.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaBrowser.h"
#import <YBImageBrowser.h>

@implementation DZMediaBrowser

static DZMediaBrowser *instance = nil;
+(instancetype)Shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DZMediaBrowser alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self resetConfigration];
    }
    return self;
}

-(void)resetConfigration{
    
}

// 显示 图片九宫格
- (void)browserSquareWithData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index{

    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = [DZMediaModel convertAttachData:attachArray];
    browser.currentPage = index;
    [browser show];
}

- (void)browserSingleWithPic:(NSString *)imageUrl preview:(UIView *)preView{
    
    YBIBImageData *data = [[YBIBImageData alloc] init];
    data.imageURL = KURLString(imageUrl);
    data.projectiveView = preView;
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = @[data];
//    browser.currentPage = 0;
    [browser show];
    
}






@end
