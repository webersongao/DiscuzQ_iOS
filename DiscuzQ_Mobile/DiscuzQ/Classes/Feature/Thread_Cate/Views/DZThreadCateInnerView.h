//
//  DZThreadCateInnerView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateInnerView : DZScrollView

@property (nonatomic ,copy) backIntegerBlock backSBlock;

-(void)first_updateInnerCateData:(NSInteger)index;

- (instancetype)initWithInnerFrame:(CGRect)frame cate:(DZThreadCateM *)dataCate;

@end

NS_ASSUME_NONNULL_END
