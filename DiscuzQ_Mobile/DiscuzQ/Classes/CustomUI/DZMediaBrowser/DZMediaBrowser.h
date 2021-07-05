//
//  DZMediaBrowser.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZMediaModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMediaBrowser : NSObject

+(instancetype)Shared;

// 单图
- (void)browserSingleWithPic:(NSString *)imageUrl preview:(UIView *)preView;

// 显示 九宫格
- (void)browserSquareWithData:(NSArray<DZQDataAttachment *> *)attachArray DidSelectItem:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
