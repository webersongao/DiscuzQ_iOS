//
//  DZThreadCateInnerView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateInnerView : UIScrollView

@property (nonatomic ,copy) backIntegerBlock backSBlock;

-(void)first_updateInnerCateData:(NSInteger)index;

- (instancetype)initWithInnerFrame:(CGRect)frame cate:(DZQDataCate *)dataCate;

@end

NS_ASSUME_NONNULL_END
