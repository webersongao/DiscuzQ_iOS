//
//  DZInstroductionView.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/19.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DisMissBlock)(void);

@interface DZInstroductionView : UIScrollView

@property (nonatomic, copy) DisMissBlock dismissBlock;

- (void)setPerpage:(NSMutableArray<UIImage *> *)imageArr;

@end
