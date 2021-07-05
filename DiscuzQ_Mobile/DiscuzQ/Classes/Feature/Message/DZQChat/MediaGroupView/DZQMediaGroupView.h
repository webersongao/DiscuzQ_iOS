//
//  DZQMediaGroupView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  图片展示视图

#import <UIKit/UIKit.h>
#import "DZQMediaImageCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^SSImageDismissBlock)(void);

@interface DZQMediaGroupView : UIView

//关闭当前视图
@property(nonatomic,copy)SSImageDismissBlock dismissBlock;

-(instancetype)initWithGroupItems:(NSArray *)groupItems currentIndex:(NSInteger)currentIndex;



@end

NS_ASSUME_NONNULL_END
