//
//  UserBarView.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZVerticalButton.h"
@class TextIconModel;

typedef void(^ToolItemClickBlock)(DZVerticalButton *sender, NSInteger index, NSString *name);

@interface UserBarView : UIView

@property (nonatomic, strong) NSMutableArray<TextIconModel *> *iconTextArr;

@property (nonatomic, copy) ToolItemClickBlock toolItemClickBlock;

@end
