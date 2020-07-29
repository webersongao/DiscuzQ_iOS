//
//  DZEmailHelper.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/4/8.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZEmailHelper : NSObject

@property (nonatomic, weak) UINavigationController *navigationController;

+ (instancetype)Helper;

- (void)prepareSendEmail;


@end





