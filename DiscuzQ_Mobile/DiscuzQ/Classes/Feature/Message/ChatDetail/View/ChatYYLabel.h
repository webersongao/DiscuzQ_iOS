//
//  ChatYYLabel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/7/2.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "YYLabel.h"
typedef void(^CopyBlock)(void);
typedef void(^DeleteBlock)(void);

@interface ChatYYLabel : YYLabel

@property (nonatomic, copy) _Nullable CopyBlock copyBlock;
@property (nonatomic, copy) _Nullable DeleteBlock deleteBlock;

@end
