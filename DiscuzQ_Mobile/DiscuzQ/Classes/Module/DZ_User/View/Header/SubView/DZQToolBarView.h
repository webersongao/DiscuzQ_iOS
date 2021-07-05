//
//  DZQToolBarView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQToolBarView : UIView



-(void)updateFans:(NSInteger)fans follow:(NSInteger)follow thread:(NSInteger)thread;

-(void)configAction:(id)target fans:(SEL)fction follow:(SEL)followction topic:(SEL)topiction;


@end

NS_ASSUME_NONNULL_END
