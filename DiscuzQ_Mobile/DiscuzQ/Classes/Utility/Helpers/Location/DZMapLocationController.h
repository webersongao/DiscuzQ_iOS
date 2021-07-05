//
//  DZMapLocationController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DZLocationBlock)(NSDictionary *locationDict, NSError *error);

@interface DZMapLocationController : DZBaseViewController

@property(nonatomic,copy) DZLocationBlock locationBlock;

@end

NS_ASSUME_NONNULL_END
