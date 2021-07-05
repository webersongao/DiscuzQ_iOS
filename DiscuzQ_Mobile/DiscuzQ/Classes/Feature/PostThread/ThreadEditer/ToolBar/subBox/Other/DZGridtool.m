//
//  DZGridtool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZGridtool.h"
#import "DZPickerHeader.h"

@implementation DZGridtool


+(NSArray<DZMediaModel *> *)filterAttachFileList:(NSArray<DZMediaModel *> *)fileArray{
    
    NSArray *muArray = fileArray ? fileArray : @[];
    NSMutableArray *filterArray = [NSMutableArray array];
    for (DZMediaModel *obj in muArray) {
        if (obj.mediaType != DZMedia_none) {
            [filterArray addObject:obj];
        }
    }
    [filterArray addObject:[DZMediaModel placeHolderMedia]];
    
    return filterArray.copy;
}

@end
