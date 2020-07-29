//
//  DZWebUrlCenter.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/1/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZWebUrlCenter : NSObject

@property (nonatomic, assign) BOOL isAllowJS;  //!< 是否执行抖猫的 URl跳转JS

- (BOOL)processWebviewWithReqString:(NSString *)UrlString;




@end

