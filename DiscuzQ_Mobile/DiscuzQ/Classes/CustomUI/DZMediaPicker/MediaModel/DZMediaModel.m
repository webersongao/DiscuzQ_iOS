//
//  DZMediaModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMediaModel.h"
#import <WBSUtils/YBImageBrowser.h>

@implementation DZMediaModel

+(instancetype)placeHolderMedia{
    
    DZMediaModel *media = [DZMediaModel new];
    media.thumbPath = @"publish_picture_add_icon";
    media.mediaType = DZMedia_none;
    
    media.mediaName = @"这是一个占位的文件";
    media.mediaTypeStr = @"文件";
    
    return media;
}


- (instancetype)initWithImage:(NSString *)imageUrl preview:(UIView *)preView{
    
    self = [super init];
    if (self) {
        _preview = preView;
        _mediaPath = imageUrl;
    }
    return self;
}




+(NSArray *)convertAttachData:(NSArray<DZQDataAttachment *> *)attachDataArray{
    
    NSMutableArray *preDataArray = [NSMutableArray array];
    
    for (DZQDataAttachment *attach in attachDataArray) {
        YBIBImageData *data1 = [YBIBImageData new];
        data1.imageURL = KURLString(attach.attributes.url);
        data1.projectiveView = nil;// [homeCell squarePicView];
        [preDataArray addObject:data1];
    }
    
    return preDataArray;
}

@end
