//
//  DZQToolBarView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQToolBarView : UIView



-(void)updateFans:(NSInteger)fans follow:(NSInteger)follow topic:(NSInteger)topic;

-(void)configAction:(id)target fans:(SEL)fction follow:(SEL)followction topic:(SEL)topiction;


@end

NS_ASSUME_NONNULL_END
