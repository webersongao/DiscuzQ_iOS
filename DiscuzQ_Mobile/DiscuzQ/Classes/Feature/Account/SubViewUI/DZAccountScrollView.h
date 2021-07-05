//
//  DZAccountScrollView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/22.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"
#import "DZTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZAccountScrollView : DZScrollView 

@property (nonatomic, strong) UIImageView *logoView;  //!< 属性注释

@property (nonatomic, strong) DZTextField *firstField;  //!< 属性注释
@property (nonatomic, strong) DZTextField *secendField;  //!< 属性注释
@property (nonatomic, strong) DZTextField *thirdField;  //!< 属性注释
@property (nonatomic, strong) IQPreviousNextView *regContentView;  //!< 属性注释

@property (nonatomic, strong) UIButton *actionButton;  //!< 属性注释




@end

NS_ASSUME_NONNULL_END
