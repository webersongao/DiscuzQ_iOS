//
//  DZWebUrlCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZWebUrlCenter : NSObject

@property (nonatomic, assign) BOOL isAllowJS;  //!< 是否执行抖猫的 URl跳转JS

- (BOOL)processWebviewWithReqString:(NSString *)UrlString;




@end

