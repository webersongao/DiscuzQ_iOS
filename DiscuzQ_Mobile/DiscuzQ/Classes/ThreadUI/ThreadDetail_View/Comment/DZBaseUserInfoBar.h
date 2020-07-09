//
//  DZBaseUserInfoBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  固定高度 kToolBarHeight

#import <UIKit/UIKit.h>
#import "DZDListStyle.h"

@interface DZBaseUserInfoBar : UIView

@property (nonatomic, assign) BOOL isSepLine;  //!< 属性注释

-(void)updateUserBar:(NSAttributedString *)attributedName avatar:(NSString *)avatar time:(NSString *)time real:(BOOL)isReal style:(DZDUserStyle *)userStyle;

@end


