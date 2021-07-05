//
//  DZMobileCtrl+Tool.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl.h"

@interface DZMobileCtrl (Tool)


// 复制 文字到粘贴板
+(void)PasteLocalBoardWithString:(NSString *)strUrl;

+(void)addObserver:(id)observer sel:(SEL)selName name:(NSString *)name;

+(void)postNotification:(NSString *)name obj:(id)obj userinfo:(NSDictionary *)info;






@end


