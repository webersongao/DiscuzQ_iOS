//
//  DZInstroductionView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/19.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"

typedef void(^DisMissBlock)(void);

@interface DZInstroductionView : DZScrollView

@property (nonatomic, copy) DisMissBlock dismissBlock;

- (void)setPerpage:(NSMutableArray<UIImage *> *)imageArr;

@end
