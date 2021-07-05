//
//  DZTermsLabel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/3/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReadTermsBlock)(void);

@interface DZTermsLabel : UIView

@property (nonatomic, assign) BOOL isAgree;

@property (nonatomic, copy) ReadTermsBlock readTermBlock;

@end
