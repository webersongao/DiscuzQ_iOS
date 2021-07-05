//
//  DZGlobalHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZGlobalHelper : NSObject

+ (DZGlobalHelper *)shared;

-(void)Global_RequestForumGlobalConfigfromServer;

@end


