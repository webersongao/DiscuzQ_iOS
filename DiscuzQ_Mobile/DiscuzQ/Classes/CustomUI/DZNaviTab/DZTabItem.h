//
//  DZTabItem.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"


@interface DZTabItem : NSObject

@property (nonatomic, copy,readonly) NSString *title;  //!< 属性注释
@property (nonatomic, strong,readonly) Class subCls;  //!< 属性注释
@property (nonatomic, strong) DZBaseViewController *viewCtrl;  //!< 初始化时候不需要赋值

- (instancetype)initWithTitle:(NSString *)title class:(Class)subCls;



@end
