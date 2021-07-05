//
//  DZNavItemButton.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/4/4.
//  Copyright © 2019 DouMaoKeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZBarButtonItem.h"


@interface DZNavItemButton : UIButton

@property (nonatomic, strong, readonly) UIButton *innerButton;  //!< 属性注释

-(void)updateInnerButton:(DZBarButtonItem *)buttonItem;




@end


