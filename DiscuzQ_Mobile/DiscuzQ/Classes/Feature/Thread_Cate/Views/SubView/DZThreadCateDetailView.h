//
//  DZThreadCateDetailView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadCateDetailView : UIScrollView

-(void)first_updateSuperCateData;
- (instancetype)initWithFrame:(CGRect)frame cate:(DZQDataCate *)dataCate;

@end

NS_ASSUME_NONNULL_END
