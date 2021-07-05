//
//  DZScanTypeViewController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZPlayBaseViewController.h"
@class DZThreadTypeModel;
NS_ASSUME_NONNULL_BEGIN

@interface DZScanTypeViewController : DZPlayBaseViewController

- (instancetype)initWithFrame:(CGRect)frame cate:(DZThreadTypeModel *)model;

-(void)updateHomeCateControllerView;

@end

NS_ASSUME_NONNULL_END
